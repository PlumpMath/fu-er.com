#include "header.hpp"

header::header()
{
  setStyleClass("header"); 

  layout_->setSpacing(0);
  layout_->setContentsMargins(0, 0, 0, 0);
  //layout_->setStretchFactor(background_, 0);
  setLayout(layout_);

  //background_->setMinimumSize(WLength::Auto, WLength::Auto);
  //setMinimumSize(WLength::Auto, WLength::Auto);
  layout_->addWidget(background_);
  layout_->addWidget(navbar_);
}
