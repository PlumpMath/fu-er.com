#include "header.hpp"

header::header()
{
  layout_->setSpacing(0);
  layout_->setContentsMargins(0, 0, 0, 0);
  setLayout(layout_);

  layout_->addWidget(background_);
  layout_->addWidget(navbar_);
}
