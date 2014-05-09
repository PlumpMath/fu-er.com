#include <vector>
#include <iostream>

#include <Wt/WApplication>
#include <Wt/WBreak>
#include <Wt/WText>
#include <Wt/WContainerWidget>
#include <Wt/WVBoxLayout>
#include <Wt/WGridLayout>
#include <Wt/WScrollArea>

using namespace Wt;

#include "header/header.hpp"
#include "main/index.hpp"
#include "gallery/index.hpp"
#include "about/index.hpp"
#include "resume/index.hpp"

class application : public WApplication
{
  public:
    application(WEnvironment const &env)
      : WApplication(env)
    {
      setTitle("Fu-Er | Programmer | Artist");
      useStyleSheet("style.css");

      root()->setPadding(0);

      root()->addWidget(header_);
      root()->addWidget(content_);
      root()->addWidget(new WText("<br/><small>Copyright 2014 Fu-Er Toh. All rights reserved.</small>"));

      root()->setOverflow(WContainerWidget::OverflowAuto, Vertical);
      root()->setOverflow(WContainerWidget::OverflowHidden, Horizontal);

      internalPathChanged().connect(this, &application::on_internal_path_changed);
      //std::cerr << "initial ip: " << internalPath() << std::endl;
      on_internal_path_changed(internalPath());
    }

    static WApplication* create(WEnvironment const &env)
    { return new application(env); }

  private:
    void on_internal_path_changed(std::string path)
    {
      if(content_)
      {
        content_->hide();
        root()->removeWidget(content_);
      }

      WContainerWidget *content{};
      if(path.find(home::PATH) == 0)
      {
        path.erase(0, std::string{ home::PATH }.size());
        content = new home();
        header_->path_changed(nav::main);
      }
      else if(path.find(about::PATH) == 0)
      {
        path.erase(0, std::string{ about::PATH }.size());
        content = new about();
        header_->path_changed(nav::about);
      }
      else if(path.find(gallery::PATH) == 0)
      {
        path.erase(0, std::string{ gallery::PATH }.size());
        content = new gallery(path);
        header_->path_changed(nav::gallery);
      }
      else if(path.find(resume::PATH) == 0)
      {
        path.erase(0, std::string{ resume::PATH }.size());
        content = new resume();
        header_->path_changed(nav::resume);
      }
      else
      {
        content = new home();
        header_->path_changed(nav::main);
      }

      root()->insertWidget(1, content);
      content_ = content;
    }

    header * const header_{ new header{} };
    WContainerWidget *content_{ new home{} };
};

int main(int argc, char **argv)
{ return WRun(argc, argv, &application::create); }

