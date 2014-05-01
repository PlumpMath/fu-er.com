#include "navbar.hpp"

navbar::navbar()
  : imgs_
    {{
      { new WImage("img/header/main.png"), new WImage("img/header/main_selected.png") },  
      { new WImage("img/header/gallery.png"), new WImage("img/header/gallery_selected.png") },  
      { new WImage("img/header/separator.png"), new WImage("img/header/separator.png") },  
      { new WImage("img/header/about.png"), new WImage("img/header/about_selected.png") },  
      { new WImage("img/header/resume.png"), new WImage("img/header/resume_selected.png") } 
    }}
{
  setPadding(0);

  /* Lay out the navbar images from left to right. */
  auto left_corner(new WImage("img/header/corner_left.png"));
  left_corner->setMinimumSize(left_corner->width(), left_corner->height());
  left_corner->setMaximumSize(left_corner->width(), left_corner->height());
  addWidget(left_corner);
  for(auto &it : imgs_)
  {
    it.first->setStyleClass("link");
    it.second->setStyleClass("link");
    it.first->setMinimumSize(it.first->width(), it.first->height());
    it.first->setMaximumSize(it.first->width(), it.first->height());
    it.second->setMinimumSize(it.second->width(), it.second->height());
    it.second->setMaximumSize(it.second->width(), it.second->height());

    addWidget(it.first);
    it.second->hide();
    addWidget(it.second);
  }
  auto right_corner(new WImage("img/header/corner_right.png"));
  right_corner->setMinimumSize(right_corner->width(), right_corner->height());
  right_corner->setMaximumSize(right_corner->width(), right_corner->height());
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
