#include "index.hpp"
#include "image_widget.hpp"

#include <Wt/WText>
#include <Wt/WBreak>
#include <Wt/WCssDecorationStyle>

#include <boost/filesystem.hpp>
namespace fs = boost::filesystem;     

#include <fstream>

char const * const gallery::PATH{ "/gallery" };

gallery::gallery(std::string const &path)
{
  layout_->setSpacing(0);
  layout_->setContentsMargins(0, 0, 0, 0);
  setStyleClass("content");
  setLayout(layout_);

  layout_->addWidget(sidebar_);
  sidebar_->set_body_style("gallery_sidebar_body");
  
  {
    std::ifstream ifs{ "content/gallery/sidebar_body.html" };
    if(!ifs.is_open())
    { return; }

    std::string line;
    std::vector<WText*> texts;
    while(std::getline(ifs, line))
    {
      WContainerWidget *tmp{ new WContainerWidget{} };
      auto text(new WText{ line });
      tmp->setStyleClass("gallery_link");
      text->clicked().connect(std::bind(&gallery::category_changed, this,
                                        line, text));
      tmp->addWidget(text);
      sidebar_->add_body_widget(tmp);
      texts.push_back(text);
    }
    if(texts.size())
    {
      for(auto const &t : texts)
      {
        if(path == "/" + t->text().toUTF8())
        {
          category_changed(t->text().toUTF8(), t);
          return;
        }
      }
      category_changed(texts[0]->text().toUTF8(), texts[0]);
    }
  }
}

void gallery::category_changed(std::string const &cat, WText *text)
{
  if(category_)
  { layout_->removeWidget(category_); } /* TODO: delete */
  if(category_text_)
  {
    category_text_->setText(category_->get_name());
    category_text_->parent()->setStyleClass("gallery_link");
  }

  category_ = new category{ cat };
  text->setText("<b>" + cat + "</b>");
  text->parent()->setStyleClass("gallery_sel_link");
  category_text_ = text;
  layout_->addWidget(category_);
}
