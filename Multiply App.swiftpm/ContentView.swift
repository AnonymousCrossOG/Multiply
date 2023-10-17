import SwiftUI
struct ContentView: View {
    @State private var number1 = 0
    @State private var number2 = 0
    @State private var number3 = 0
    @State private var answer = 0
    @State private var selectedTextField = "SelectedTextField"
    
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 16) {
                Spacer()
                TextField("Answer", value: $number3  , format: .number) 
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 100, height: 100, alignment: .center)
                    .padding()
                    .disabled(true)
                
                
                HStack {
                    TextField("Number 1", value: $number1, format: .number)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                    
                    
                    TextField("Number 2", value: $number2, format: .number) 
                        .textFieldStyle(.roundedBorder)
                        .padding()
                        
                    
                    
                    
                    
                    
                    
                }.onChange(of: number1, perform: { value in
                    number3 = number1 * number2
                })
                .onChange(of: number2, perform: { value in
                    number3 = number1 * number2
                })
             
                
                
                
                HStack {
                    
                    CalculatorButton(text: "C", backgroundColor: Color.gray)
                    CalculatorButton(text: "+/-", backgroundColor: Color.gray)
                    CalculatorButton(text: "%", backgroundColor: Color.gray)
                    CalculatorButton(text: "/", backgroundColor: Color.orange)
                }
                
                HStack {
                    CalcButton(text: "7", number: $number1)
                    CalcButton(text: "8", number: $number1)
                    CalcButton(text: "9", number: $number1)
                    CalculatorButton(text: "x", backgroundColor: Color.orange)
                }
                
                
                HStack {
                    CalcButton(text: "4", number: $number1)
                    CalcButton(text: "5", number: $number1)
                    CalcButton(text: "6", number: $number1)
                    CalculatorButton(text: "-", backgroundColor: Color.orange)
                }
                
                HStack {
                    CalcButton(text: "1", number: $number1)
                    CalcButton(text: "2", number: $number1)
                    CalcButton(text: "3", number: $number1)
                    CalculatorButton(text: "+", backgroundColor: Color.orange)
                }
                
                HStack {
                    CalcButton(text: "0", number: $number1)
                    CalculatorButton(text: ".")
                    CalculatorButton(text: "=", backgroundColor: Color.orange)
                    
                    
                }
            }
            .padding()
        }
        
        
    }
    
    struct CalculatorButton: View {
        var text: String
        var backgroundColor: Color = Color.gray
        
        var body: some View {
            Text(text)
                .font(.title)
                .frame(width: 70, height: 70) // Make buttons circular
                .foregroundColor(.black)
                .background(backgroundColor)
                .clipShape(Circle()) // Clip the button to a circle shape
        }
    }
    
    struct CalcButton: View {
        var text: String
        @Binding var number: Int
        var backgroundColor: Color = Color.gray
        
        var body: some View {
            Button(text) {
                if let value = Int(text) {
                    number = number * 10 + value
                }
            } 
            .font(.title)
            .frame(width: 70, height: 70) // Make buttons circular
            .foregroundColor(.black)
            .background(backgroundColor)
            .clipShape(Circle()) // Clip the button to a circle shape
        }
    }
    
    
    struct CapsuleButton: View {
        var text: String
        var backgroundColor: Color = Color.gray
        
        var body: some View {
            Text(text)
                .font(.title)
                .frame(width: 150, height:80) // Make buttons circular
                .foregroundColor(.black)
                .background(backgroundColor)
                .clipShape(Capsule()) // Clip the button to a circle shape
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
