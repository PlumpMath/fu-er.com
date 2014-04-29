#pragma once

#include <Wt/WContainerWidget>
#include <Wt/WVBoxLayout>
#include <Wt/WImage>
using namespace Wt;

class home : public WContainerWidget
{
  public:
    static char const * const PATH;

    home();
    home(home const&) = delete;
    home(home &&) = delete;
    home& operator =(home const&) = delete;
    home& operator =(home &&) = delete;

  private:
    WVBoxLayout * const layout_{ new WVBoxLayout{} };
};
