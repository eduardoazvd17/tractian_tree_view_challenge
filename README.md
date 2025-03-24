# Tractian Tree View Challenge

A Flutter application that visualizes company assets in a hierarchical tree structure, built as part of the Tractian Mobile Software Engineer challenge.

## Overview

This application provides an intuitive interface for visualizing and managing industrial assets through a tree structure. It allows users to navigate through companies, locations, assets, and components while providing powerful filtering capabilities.

## Features

### 1. Home Page
- Company selection interface
- Clean and intuitive navigation
- Easy access to different companies' asset hierarchies

### 2. Asset Tree View
- Hierarchical visualization of assets, components, and locations
- Interactive tree structure with expandable/collapsible nodes
- Visual indicators for different types of items:
  - 📍 Locations
  - 🏭 Assets
  - ⚙️ Components

### 3. Advanced Filtering
- Text-based search across all items
- Energy sensor filter
- Critical sensor status filter
- Smart path preservation (parent items remain visible when filtering)

## Technical Implementation

### Architecture
- Built with Flutter 3.29+
- Follows clean architecture principles
- Implements GetX for state management and dependency injection

### Data Structure
The application handles three main types of entities:
1. **Locations**
   - Can contain sub-locations
   - Represent physical spaces in the company
   - Optional parent-child relationships

2. **Assets**
   - Can contain sub-assets
   - Associated with locations
   - Can have multiple components

3. **Components**
   - Can be sensors (vibration or energy)
   - Have operating status
   - Can be linked to assets or locations

### API Integration
- Integrates with Tractian's demo API
- Endpoints:
  - `/companies`
  - `/companies/:companyId/locations`
  - `/companies/:companyId/assets`

## Demo

### Video Demonstration
You can watch the demo video [here](https://raw.githubusercontent.com/eduardoazvd17/tractian_tree_view_challenge/main/media/video/presentation.mp4)

### Screenshots
<div style="display: flex; gap: 20px;">
  <img src="https://raw.githubusercontent.com/eduardoazvd17/tractian_tree_view_challenge/main/media/screenshots/home.png" alt="Home Screen" width="200" />
  <img src="https://raw.githubusercontent.com/eduardoazvd17/tractian_tree_view_challenge/main/media/screenshots/assets.png" alt="Assets View" width="200" />
</div>

## Future Improvements

If given more time, I would focus on the following improvements:

1. **Performance Optimizations**
   - Implement pagination for large datasets
   - Add caching layer for API responses
   - Optimize tree rendering for large hierarchies

2. **User Experience**
   - Add animations for tree transitions
   - Implement drag-and-drop for manual tree restructuring
   - Add bulk operations for multiple items

3. **Additional Features**
   - Offline support with local storage

4. **Testing**
   - Add comprehensive unit tests
   - Implement widget tests for UI components
   - Add integration tests for critical user flows

5. **Technical Debt**
   - Refactor tree building logic for better maintainability
   - Add logging and analytics
   - Improve code documentation

## Getting Started

1. Clone the repository
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the application:
   ```bash
   flutter run
   ```

## Dependencies

- Flutter 3.29+
- GetX for routes, state management and dependency injection
- Other essential Flutter packages

## Note

This project was built as part of the Tractian Mobile Software Engineer challenge, focusing on creating an efficient and user-friendly asset management interface.
