#include "index.hpp"
#include "misc/html_text.hpp"

#include <Wt/WText>
#include <Wt/WBreak>

char const * const resume::PATH{ "/resume" };

resume::resume()
{
  setStyleClass("content");
  layout_->setSpacing(0);

  container_->setStyleClass("resume");
  container_->setLayout(layout_);
  layout_->addWidget(new html_text{ "content/resume/index.html" });

  addWidget(container_);
}
