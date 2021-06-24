

import SwiftUI

struct ContentView: View {
    
    @State var showDetail = false
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            Button(action : {
                self.showDetail.toggle()
            }) {
                VStack {
                    Text("Перейти к окну")
                        .foregroundColor(.black)
                        .frame(width: 120, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                        .cornerRadius(25)
                        .shadow(color: .white, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                        .padding()
                    Spacer()
                    DetailView(showDetail: $showDetail)
                        .offset(y: showDetail ? 0 : 600)
                        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                }
                
            }
            
            
            
        }
        
    }
}

extension UIView {
    func roundCorners(_ corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}


struct DetailView: View {
    @Binding var showDetail: Bool
    
    var body: some View{
        ZStack{
            Color(.white).edgesIgnoringSafeArea(.bottom)
            VStack (alignment: .leading){
                
                Text("Выберите тип камеры")
                    .foregroundColor(.black)
                    //.font(.system(size: 20, weight: .light, design: .serif))
                    .font(Font.custom("OpenSans-Regular", size: 17.0))
                    .padding(.bottom,21)
                    .padding(.leading,21)
                    .padding(.trailing,21)
                //.position(x:120,y:30)
                
                
                VStack(alignment: .leading) {
                    Text("IVideon")
                        //.font(.system(size: 25, weight: .light, design: .serif))
                        .font(Font.custom("OpenSans-Regular", size: 22.0))
                    Text("Ваш аккаунт Ivideon уже подключен к учетной записи Security Hub.Информация со всех камер из аккаунта iVideon будет загружаться автоматически")
                        .font(Font.custom("OpenSans-Regular", size: 17.0))
                        .foregroundColor(.black)
                }
                .padding(.bottom,21)
                .padding(.leading,21)
                .padding(.trailing,21)
                
                VStack(alignment: .leading) {
                    Text("IP камера")
                        .font(Font.custom("OpenSans-Regular", size: 22.0))
                        .foregroundColor(.black)
                    Text("Нажмите для подключения камеры с системой протокола RSTP")
                        .font(Font.custom("OpenSans-Regular", size: 17.0))
                        .foregroundColor(.black)
                }
                .padding(.bottom,21)
                .padding(.leading,21)
                .padding(.trailing,21)
                
                
                
                
                //.position(x:200,y:-70)
                //.navigationBarTitle(Text("Тип камеры"))
                
                
                //.font(.system(size: 10))
                
                
                //.listStyle(GroupedListStyle())
                
                
            }
        }
        
        
        .frame(maxWidth: 420, maxHeight: 350)
        //.background(Color.white)
        //.clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .cornerRadius(30, corners: [.topLeft, .topRight])
        .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
        .offset(y: 35)
        // .ignoresSafeArea()
        
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Font {
    
    /// Create a font with the large title text style.
    public static var largeTitle: Font {
        return Font.custom("OpenSans-Regular", size: UIFont.preferredFont(forTextStyle: .largeTitle).pointSize)
    }
    
    /// Create a font with the title text style.
    public static var title: Font {
        return Font.custom("OpenSans-Regular", size: UIFont.preferredFont(forTextStyle: .title1).pointSize)
    }
    
    /// Create a font with the headline text style.
    public static var headline: Font {
        return Font.custom("OpenSans-Regular", size: UIFont.preferredFont(forTextStyle: .headline).pointSize)
    }
    
    /// Create a font with the subheadline text style.
    public static var subheadline: Font {
        return Font.custom("OpenSans-Light", size: UIFont.preferredFont(forTextStyle: .subheadline).pointSize)
    }
    
    /// Create a font with the body text style.
    public static var body: Font {
        return Font.custom("OpenSans-Regular", size: UIFont.preferredFont(forTextStyle: .body).pointSize)
    }
    
    /// Create a font with the callout text style.
    public static var callout: Font {
        return Font.custom("OpenSans-Regular", size: UIFont.preferredFont(forTextStyle: .callout).pointSize)
    }
    
    /// Create a font with the footnote text style.
    public static var footnote: Font {
        return Font.custom("OpenSans-Regular", size: UIFont.preferredFont(forTextStyle: .footnote).pointSize)
    }
    
    /// Create a font with the caption text style.
    public static var caption: Font {
        return Font.custom("OpenSans-Regular", size: UIFont.preferredFont(forTextStyle: .caption1).pointSize)
    }
    
    public static func system(size: CGFloat, weight: Font.Weight = .regular, design: Font.Design = .default) -> Font {
        var font = "OpenSans-Regular"
        switch weight {
        case .bold: font = "OpenSans-Bold"
        case .heavy: font = "OpenSans-ExtraBold"
        case .light: font = "OpenSans-Light"
        case .medium: font = "OpenSans-Regular"
        case .semibold: font = "OpenSans-SemiBold"
        case .thin: font = "OpenSans-Light"
        case .ultraLight: font = "OpenSans-Light"
        default: break
        }
        return Font.custom(font, size: size)
    }
}

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
