# swiftui_classic-tabview_show-hide

# motivation
- swiftUI has quite poor TabView, it doesn't allow you
  - set any icon size 
  - set default colors for system icons and labels
  - place more complicated views than simple image
  - resize image for icon just in  time 
  - hide the tab bar when you don't need it

# simplified idea
  - place swiftui tabView
  - hide it's tab bar forever and use for storing content
  - show our own custom tab bar on the specific pages or evven whole view hierarchies
  - handle user's interacctions from custom tab bar
  - programmatically switch selected tab in swiftui's tabVView
  
# key moments
- navigationViewState 
  - stores tabView seleted item
- viewContainers are dedicated to 
  - map state to view props 
  - pass props to it's view
  - provide a reactions from ui to the business layer
- views
  - show the ui elemnts accoridng to their props 
  - handle user's interactions and call related handlers
  - aggrigate view logic




 
 
