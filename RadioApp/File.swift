enum Tab {
  case chats, otherTab
}
struct TestContentView: View {
  @State private var currentTab: Tab

  var body: some View {
    NavigationView{
      TabView(selection: $currentTab){
        ChatsView()
          .tabItem{
            ...
          }
          .tag(Tab.chats)
          .navigationBarHidden(false)
        OtherTab()
          .tabItem{
            ...
          }
          .tag(Tab.otherTab)
          .navigationBarHidden(true)
      }
      .navigationBarTitle("Messages")
    }
  }
}

struct TestContentView_Preview
