#pragma once

#include <Wt/WContainerWidget>
#include <Wt/WHBoxLayout>
#include <Wt/WImage>
using namespace Wt;

#include "misc/sidebar.hpp"

class about : public WContainerWidget
{
  public:
    static char const * const PATH;

    about();
    about(about const&) = delete;
    about(about &&) = delete;
    about& operator =(about const&) = delete;
    about& operator =(about &&) = delete;

  private:
    WHBoxLayout * const layout_{ new WHBoxLayout{} };
    sidebar * const sidebar_{ new sidebar
    {
      "about_sidebar",
      { "about_sidebar_title", "content/about/sidebar_title.html" },
      { "about_sidebar_body", "content/about/sidebar_body.html" }
    }};
};
