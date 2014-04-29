#include "index.hpp"

#include <Wt/WText>
#include <Wt/WAnchor>
#include <Wt/WBorder>
#include <Wt/WCssDecorationStyle>

char const * const home::PATH{ "/home" };

void create_banner(WVBoxLayout *layout,
                   std::string const &link,
                   std::string const &file)
{
  WAnchor *anchor{ new WAnchor{ WLink{ WLink::InternalPath, link } } };
  WImage *img{ new WImage{ file } };
  WBorder const border{ WBorder::Solid };
  img->decorationStyle().setBorder(border);
  anchor->addWidget(img);
  layout->addWidget(anchor);
}

home::home()
{
  layout_->setSpacing(9);
  setLayout(layout_);
  setStyleClass("main");
  create_banner(layout_, "/gallery/Vector", "img/main/banner_vector.png");
  create_banner(layout_, "/gallery/Raster", "img/main/banner_raster.png");
  create_banner(layout_, "/gallery/Sketches", "img/main/banner_sketches.png");
  create_banner(layout_, "/gallery/Clay", "img/main/banner_clay.png");
}
