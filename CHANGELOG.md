# Changelog

All notable changes to this project will be documented in this file.

## [1.1.0] - 2018-10-08
### Added

- User generated content (Campaigns and Googies) is translated (Using
  Rails i18n and globalize)
  - Switch the language in the back-office (ActiveAdmin) while editing
    a resource and hit save
  - Now all content (pages and user generated content) is translated!
  
- Introduce Rubocop for linting

### Changed

- Integration tests run with Firefox headless instead of Chromium
- Upgrade from CircleCI v1 to v2
- Upgrade to Rails 5.1.6 (latest in 5.1.x branch) and remove
  deprecation messages
- Goody validates presence of :title, :description
