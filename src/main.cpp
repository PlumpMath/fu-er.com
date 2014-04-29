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
      setTitle("Fu Er");
      useStyleSheet("style.css");

      /** Topness **/
      auto topness_container(new WContainerWidget());
      //topness_container->setStyleClass("topness");
      auto topness_layout(new WVBoxLayout());
      topness_container->setLayout(topness_layout);
      root()->addWidget(topness_container);

      //auto topness(new WImage("img/header/invisible.png"));
      //topness->setWidth(WLength(100.0f, WLength::Percentage));
      //topness->setHeight(1.0f);
      //topness_layout->addWidget(topness);

      root()->addWidget(header_);
      root()->addWidget(content_);

      /** Footer **/
      auto lower_container(new WContainerWidget());
      //lower_container->setStyleClass("lower");
      auto lower_layout(new WVBoxLayout());
      lower_container->setLayout(lower_layout);
      root()->addWidget(lower_container);

      lower_layout->addWidget(new WText("<small>Copyright 2014 Fu-Er Toh. All rights reserved.</small>"));

      root()->setOverflow(WContainerWidget::OverflowAuto, Vertical);
      root()->setOverflow(WContainerWidget::OverflowHidden, Horizontal);

      internalPathChanged().connect(this, &application::on_internal_path_changed);
      setInternalPath(home::PATH, true);
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

      root()->insertWidget(2, content);
      content_ = content;
    }

    header * const header_{ new header{} };
    WContainerWidget *content_{ new home{} };
};

int main(int argc, char **argv)
{ return WRun(argc, argv, &application::create); }

