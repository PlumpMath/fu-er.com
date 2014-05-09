#include "navbar.hpp"

navbar::navbar()
  : imgs_
    {{
      { new WImage("img/header/main.png"), new WImage("img/header/main_selected.png") },  
      { new WImage("img/header/gallery.png"), new WImage("img/header/gallery_selected.png") },  
      { new WImage("img/header/about.png"), new WImage("img/header/about_selected.png") },  
      { new WImage("img/header/resume.png"), new WImage("img/header/resume_selected.png") } 
    }}
{
  setPadding(0);

  /* Lay out the navbar images from left to right. */
  auto left_corner(new WImage("img/header/corner_left.png"));
  left_corner->setMinimumSize(133, 47);
  left_corner->setMaximumSize(133, 47);
  addWidget(left_corner);
  for(size_t i{}; i < imgs_.size(); ++i)
  {
    imgs_[i].first->setStyleClass("link");
    imgs_[i].second->setStyleClass("link");
    imgs_[i].first->setMinimumSize(140, 47);
    imgs_[i].first->setMaximumSize(140, 47);
    imgs_[i].second->setMinimumSize(140, 47);
    imgs_[i].second->setMaximumSize(140, 47);

    addWidget(imgs_[i].first);
    imgs_[i].second->hide();
    addWidget(imgs_[i].second);

    if(i == 1)
    {
      auto separator(new WImage("img/header/separator.png"));
      separator->setMinimumSize(180, 47);
      separator->setMaximumSize(180, 47);
      addWidget(separator);
    }
  }
  auto right_corner(new WImage("img/header/corner_right.png"));
  right_corner->setMinimumSize(127, 47);
  right_corner->setMaximumSize(127, 47);
  addWidget(right_corner);

  imgs_[to_int(nav::main)].first->clicked().connect(this,
                              &navbar::on_click<nav::main>);
  imgs_[to_int(nav::gallery)].first->clicked().connect(this,
                              &navbar::on_click<nav::gallery>);
  imgs_[to_int(nav::about)].first->clicked().connect(this,
                              &navbar::on_click<nav::about>);
  imgs_[to_int(nav::resume)].first->clicked().connect(this,
                              &navbar::on_click<nav::resume>);
}
