#pragma once

#include <map>
#include <string>

#include <Wt/WContainerWidget>
#include <Wt/WHBoxLayout>
#include <Wt/WVBoxLayout>
#include <Wt/WImage>
#include <Wt/WScrollArea>
using namespace Wt;

#include "misc/sidebar.hpp"
#include "category.hpp"

class image_widget;

class gallery : public WContainerWidget
{
  public:
    static char const * const PATH;

    gallery() = delete;
    gallery(std::string const &path);
    gallery(gallery const&) = delete;
    gallery(gallery &&) = delete;
    gallery& operator =(gallery const&) = delete;
    gallery& operator =(gallery &&) = delete;

  private:
    void category_changed(std::string const &, WText*);

    WHBoxLayout * const layout_{ new WHBoxLayout{} };
    sidebar * const sidebar_{ new sidebar
    {
      "gallery_sidebar",
      { "gallery_sidebar_title", "content/gallery/sidebar_title.html" },
    }};
    category *category_{};
    WText *category_text_{};
};
