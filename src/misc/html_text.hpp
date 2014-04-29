#pragma once

#include <Wt/WText>
using namespace Wt;

class html_text : public WText
{
  public:
    static char const * const PATH;

    html_text() = delete;
    explicit html_text(std::string const &path);
    html_text(html_text const&) = delete;
    html_text(html_text &&) = delete;
    html_text& operator =(html_text const&) = delete;
    html_text& operator =(html_text &&) = delete;
};
