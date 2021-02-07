
import SwiftUI

struct ButtonWeather: View {
    
    var text: String
    var backgroundColor: Color
    var foregroundColor: Color
    
    @Binding
    var dayTime: Bool
    
    var body: some View {
        Button {
            self.dayTime.toggle()
        }label: {
            Text(text)
                .frame(width: 280, height: 50)
                .background(backgroundColor)
                .foregroundColor(foregroundColor)
                .font(.system(size: 20, weight: .bold))
                .cornerRadius(10)
        }
    }
}

