#pragma once

#include <Wt/WContainerWidget>
#include <Wt/WVBoxLayout>
using namespace Wt;

class resume : public WContainerWidget
{
  public:
    static char const * const PATH;

    resume();
    resume(resume const&) = delete;
    resume(resume &&) = delete;
    resume& operator =(resume const&) = delete;
    resume& operator =(resume &&) = delete;

  private:
    WVBoxLayout * const layout_{ new WVBoxLayout{} };
    WContainerWidget * const container_{ new WContainerWidget{} };
};
