#include "sidebar.hpp"
#include "html_text.hpp"

#include <Wt/WText>

sidebar::sidebar(std::string const &style, class_content_path const &title)
  : sidebar(style, title, { "", "" })
{ }

sidebar::sidebar(std::string const &style,
                 sidebar::class_content_path const &title,
                 sidebar::class_content_path const &body)
{
  setStyleClass(style);
  layout_->setSpacing(0);
  layout_->setContentsMargins(0, 0, 0, 0);
  setLayout(layout_);

  layout_->addWidget(title_container_);
  title_container_->setStyleClass(title.first);
  title_container_->setPadding(9);

  if(title.second.size())
  { title_container_->addWidget(new html_text{ title.second }); }

  body_container_->setStyleClass(body.first);
  body_container_->setPadding(9, Left | Top | Bottom);
  layout_->addWidget(body_container_, 1);

  if(body.second.size())
  { body_container_->addWidget(new html_text{ body.second }); }
}

void sidebar::set_body_style(std::string const &style)
{ body_container_->setStyleClass(style); }
