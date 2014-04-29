#pragma once

#include <Wt/WContainerWidget>
#include <Wt/WVBoxLayout>
#include <Wt/WImage>
using namespace Wt;

#include <string>
#include <utility>

class sidebar : public WContainerWidget
{
  public:
    static char const * const PATH;

    using class_content_path = std::pair<std::string, std::string>;

    sidebar() = delete;
    explicit sidebar(std::string const &style, class_content_path const &title);
    explicit sidebar(std::string const &style, class_content_path const &title,
                     class_content_path const &body);
    sidebar(sidebar const&) = delete;
    sidebar(sidebar &&) = delete;
    sidebar& operator =(sidebar const&) = delete;
    sidebar& operator =(sidebar &&) = delete;

    template <typename T>
    void add_body_widget(T * const t)
    { body_container_->addWidget(t); }

    void set_body_style(std::string const &);

  private:
    WVBoxLayout * const layout_{ new WVBoxLayout{} };
    WContainerWidget * const title_container_{ new WContainerWidget{} };
    WContainerWidget * const body_container_{ new WContainerWidget{} };
};
