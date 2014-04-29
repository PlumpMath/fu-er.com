#include "image_widget.hpp"
#include "category.hpp"

#include <Wt/WCssDecorationStyle>

#include <boost/filesystem.hpp>
namespace fs = boost::filesystem;     

#include <fstream>

image_widget::image_widget(std::string const &dir, category * const cat)
  : WImage(dir + "/thumb.png")
  , dir_(dir)
  , category_(cat)
{
  clicked().connect(this, &image_widget::on_clicked);

  setMaximumSize(120, 120);
  setMargin(6);
  setStyleClass("link");

  WBorder border(WBorder::Solid);
  decorationStyle().setBorder(border);

  {
    std::string const path{ dir_ + "/description.txt" };
    std::ifstream ifs{ path };
    if(ifs.is_open())
    {
      ifs.seekg(0, std::ios::end);
      desc_.resize(ifs.tellg());
      ifs.seekg(0, std::ios::beg);
      ifs.read(&desc_[0], desc_.size());
    }
    desc_ = "<p>" + desc_ + "</p>";
  }

  std::vector<std::string> steps;
  fs::directory_iterator const end_itr;
  for(fs::directory_iterator itr(dir_); itr != end_itr; ++itr)
  {
    if(!fs::is_directory(itr->status()))
    {
      std::string const path{ itr->path().filename().string() };
      if(path == "description.txt" || path == "thumb.png" || path == "preview.png")
      { continue; }
      steps.push_back(itr->path().string());
    }
  }

  std::sort(steps.begin(), steps.end());
  std::transform(steps.begin(), steps.end(), std::back_inserter(steps_),
  [](std::string const &s)
  {
    auto i(new WImage{ s });
    i->setMaximumSize(120, 120);
    i->setMargin(6);
    WBorder const border{ WBorder::Solid };
    i->decorationStyle().setBorder(border);
    return i;
  });
}

image_widget* image_widget::clone()
{ return new image_widget(dir_, category_); }

void image_widget::on_clicked()
{ category_->on_preview_changed(this); }
