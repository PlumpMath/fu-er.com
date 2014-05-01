#pragma once

#include <Wt/WContainerWidget>
#include <Wt/WVBoxLayout>
#include <Wt/WHBoxLayout>
#include <Wt/WGridLayout>
#include <Wt/WImage>
#include <Wt/WBreak>
#include <Wt/WBorder>
#include <Wt/WText>
#include <Wt/WAnchor>
#include <Wt/WCssDecorationStyle>
using namespace Wt;

#include <boost/filesystem.hpp>
namespace fs = boost::filesystem;     

#include "image_widget.hpp"

class category : public WContainerWidget
{
  public:
    category() = delete;
    explicit category(std::string const &name)
      : name_{ name }
    {
      setStyleClass("gallery_category");

      layout_->setSpacing(0);
      layout_->setContentsMargins(0, 0, 0, 0);
      setLayout(layout_);

      img_container_->setStyleClass("gallery_list");
      img_container_->setOverflow(WContainerWidget::OverflowAuto,
                                  Wt::Vertical);
      img_container_->setOverflow(WContainerWidget::OverflowHidden,
                                  Wt::Horizontal);
      layout_->addWidget(img_container_);

      preview_container_->setStyleClass("gallery_preview");
      preview_container_->setOverflow(WContainerWidget::OverflowAuto,
                                      Wt::Vertical);
      preview_container_->setOverflow(WContainerWidget::OverflowHidden,
                                      Wt::Horizontal);
      layout_->addWidget(preview_container_);

      preview_container_->setLayout(preview_layout_);
      preview_container_->setMaximumSize(450, WLength::Auto);

      populate();
    }

    void on_preview_changed(image_widget * const img)
    {
      preview_image_ = img->clone();
      preview_image_->setImageLink(img->get_dir() + "/preview.png");
      step_layout_->clear();
      step_layout_ = new WGridLayout{};
      preview_layout_->clear();

      WBorder border(WBorder::Solid);
      preview_image_->decorationStyle().setBorder(border);
      auto const image_anchor(new WAnchor{ preview_image_->imageLink() });
      image_anchor->setTarget(Wt::TargetNewWindow);
      image_anchor->addWidget(preview_image_);
      preview_layout_->insertWidget(0, image_anchor);

      preview_image_->setMaximumSize(400, 400);

      auto text(new WText{ preview_image_->get_desc() });
      text->setPadding(15, Right); /* account for scroll bars */
      preview_layout_->addWidget(text);
      preview_layout_->addWidget(new WBreak{});

      WContainerWidget *step_container{ new WContainerWidget{} };
      step_container->setLayout(step_layout_);
      size_t row{}, col{};
      for(auto const &w : preview_image_->get_steps())
      {
        auto const anchor(new WAnchor{ w->imageLink() });
        anchor->setTarget(Wt::TargetNewWindow);
        anchor->addWidget(w);
        step_layout_->addWidget(anchor, row, col);
        if(++col == 3)
        { ++row; col = 0; }
      }
      preview_layout_->addWidget(step_container);
      preview_layout_->addSpacing(500);
    }

    std::string const& get_name() const
    { return name_; }

  private:
    void populate()
    {
      fs::path const dir_path{ "content/gallery/" + name_ };
      if(!fs::exists(dir_path))
      { return; }

      std::vector<std::string> dirs;
      fs::directory_iterator const end_itr;
      for(fs::directory_iterator itr(dir_path); itr != end_itr; ++itr)
      {
        if(fs::is_directory(itr->status()))
        {
          dirs.push_back(itr->path().string());
        }
      }
      std::sort(dirs.begin(), dirs.end(), std::greater<std::string>());

      size_t added{};
      for(auto const &d : dirs)
      {
        img_container_->addWidget(new image_widget(d, this));
        if(++added == 2)
        {
          img_container_->addWidget(new WBreak{});
          added = 0;
        }
      }
      if(dirs.size())
      {
        auto const w(dynamic_cast<image_widget*>(img_container_->widget(0)));
        if(w)
        { on_preview_changed(w); }
      }
    }

    std::string const name_;

    WHBoxLayout * const layout_{ new WHBoxLayout{} };
    WContainerWidget * const img_container_{ new WContainerWidget{} };
    WContainerWidget * const preview_container_{ new WContainerWidget{} };
    WVBoxLayout * const preview_layout_{ new WVBoxLayout{} };
    WGridLayout *step_layout_{ new WGridLayout{} };
    image_widget *preview_image_{};
};
