#pragma once

#include <Wt/WImage>
using namespace Wt;

class category;

class image_widget : public WImage
{
  public:
    image_widget(std::string const &dir, category * const);
    image_widget(image_widget const&) = delete;
    image_widget(image_widget &&) = delete;
    image_widget& operator =(image_widget const&) = delete;
    image_widget& operator =(image_widget &&) = delete;

    image_widget* clone();

    std::string const& get_dir() const
    { return dir_; }
    std::string const& get_desc() const
    { return desc_; }
    std::vector<WImage*> const& get_steps() const
    { return steps_; }

  private:
    void on_clicked();

    std::string const dir_;
    category * const category_{};
    std::string desc_;
    std::vector<WImage*> steps_;
};
