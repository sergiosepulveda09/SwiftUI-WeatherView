
import SwiftUI

struct ContentView: View {
    
    @State
    var isNight: Bool = false
    
    
    var body: some View {
        ZStack {
            BackgroundColor(dayTime: $isNight)
            VStack {
                
                CityView(name:"Okazaki", state: "Aichi")
                
                mainWeatherStatusView(image:"cloud.sun.fill", temperature: isNight ? 1 : 7, dayTime: $isNight)
                
                HStack(spacing: 40){
                    
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.sun.fill" ,
                                   temperature: 6)
                    
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "cloud.snow.fill" ,
                                   temperature: 1)
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "sun.max.fill" ,
                                   temperature: 7)
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "cloud.fill" ,
                                   temperature: 3)
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "snow" ,
                                   temperature: -2)
                }
                Spacer()
                
                ButtonWeather(text: "Change Day time ",
                              backgroundColor: .white,
                              foregroundColor: .blue,
                              dayTime: $isNight)
                
                Spacer()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundColor: View {
    @Binding
    var dayTime: Bool
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [dayTime ? .black : .blue, dayTime ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CityView: View {
    var name: String
    var state: String
    var body: some View {
        Text("\(name), \(state)")
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct mainWeatherStatusView: View {
    var image: String
    var temperature: Int
    @Binding
    var dayTime: Bool
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: dayTime ? "moon.stars.fill" : image)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }.padding(.bottom, 40)
    }
}
