#pragma once

#include <Wt/WContainerWidget>
#include <Wt/WVBoxLayout>
#include <Wt/WImage>
using namespace Wt;

#include "navbar.hpp"

class header : public WContainerWidget
{
  public:
    header();
    header(header const&) = delete;
    header(header &&) = delete;
    header& operator =(header const&) = delete;
    header& operator =(header &&) = delete;

    void path_changed(nav const n)
    { navbar_->path_changed(n); }

  private:
    navbar * const navbar_{ new navbar{} };
    WImage * const background_{ new WImage{"img/header/header.png"} };
    WVBoxLayout * const layout_{ new WVBoxLayout{} };
};
