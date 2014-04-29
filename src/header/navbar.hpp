#pragma once

#include <array>
#include <utility>
#include <type_traits>

#include <Wt/WContainerWidget>
#include <Wt/WHBoxLayout>
#include <Wt/WImage>
#include <Wt/WApplication>
using namespace Wt;

#include "../main/index.hpp"
#include "../gallery/index.hpp"
#include "../about/index.hpp"
#include "../resume/index.hpp"

enum class nav
{
  main,
  gallery,
  separator,
  about,
  resume,
  max
};
auto constexpr to_int(nav n) -> std::underlying_type<nav>::type 
{ return static_cast<std::underlying_type<nav>::type>(n); }

class navbar : public WContainerWidget
{
  public:
    using image_pair = std::pair<WImage * const, WImage * const>;

    navbar();
    navbar(navbar const&) = delete;
    navbar(navbar &&) = delete;
    navbar& operator =(navbar const&) = delete;
    navbar& operator =(navbar &&) = delete;

    void path_changed(nav const n)
    {
      imgs_[to_int(current_)].second->hide();
      imgs_[to_int(current_)].first->show();
      current_ = n;
      imgs_[to_int(current_)].first->hide();
      imgs_[to_int(current_)].second->show();
    }

  private:
    template <nav N>
    void on_click()
    {
      static_assert(N >= nav::main && N <= nav::resume, "Invalid navigation");
      path_changed(N);
      WApplication::instance()->setInternalPath(get_path<N>(), true);
    }

    template <nav N>
    static char const* get_path();

    nav current_{};
    std::array<image_pair, to_int(nav::max)> imgs_;
    WHBoxLayout * const layout_{ new WHBoxLayout{} };
    static constexpr const size_t corner_margin_{ 20 };
};

template <>
inline char const* navbar::get_path<nav::main>()
{ return home::PATH; }
template <>
inline char const* navbar::get_path<nav::gallery>()
{ return gallery::PATH; }
template <>
inline char const* navbar::get_path<nav::about>()
{ return about::PATH; }
template <>
inline char const* navbar::get_path<nav::resume>()
{ return resume::PATH; }
