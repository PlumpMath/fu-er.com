#include "html_text.hpp"

#include <fstream>

html_text::html_text(std::string const &path)
  : WText("", Wt::XHTMLUnsafeText)
{
  std::ifstream ifs{ path };
  if(!ifs.is_open())
  { throw std::runtime_error{ "Failed to to open file: " + path }; }

  std::string contents;
  ifs.seekg(0, std::ios::end);
  contents.resize(ifs.tellg());
  ifs.seekg(0, std::ios::beg);
  ifs.read(&contents[0], contents.size());

  setText(contents);
}
