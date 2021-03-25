//
//  ContentView.swift
//  calculatorFinal
//
//  Created by Casa Romio 2 on 25/03/2021.
//

import SwiftUI

struct ContentView: View {

    @State var output: Int? = nil
    @State var text = ""
    @State var output2: Int? = nil
    @State var text2 = ""
    @State var output3: Int? = nil
    @State var text3 = ""
    @State var total: Int? = nil
    @State var tooglePlus = false
    @State var toogleMinus = false
    @State var toogleMoltiplication = false
    @State var toogleDivision = false
    @State var toogleEqual = false
    @State var error = false
   
    // Used in final(), this method start writing the number in OUTPUT.
    func addNumber(number:Int) {
        
        // Here goes the first digit.
        if output == nil && text == "" {
            output = number
            text = "\(String(number))"
        }
        // The rest of the digits.
        else if output != nil && text != "" {
            text = text + "\(String(number))"
            output = Int(text)!
        }
        
    }
    
    // Used in final(), this method start writing the number in OUTPUT2.
    func addNumber1(number:Int) {
        
        // Here goes the first digit.
        if output2 == nil && text2 == "" {
            output2 = number
            text2 = "\(String(number))"
        }
        // The rest of the digits.
        else if output2 != nil && text2 != "" {
            text2 = text2 + "\(String(number))"
            output2 = Int(text2)!
        }
        
    }
    
    // Used in final(), this method start writing the number in OUTPUT3.
    func addNumber2(number:Int) {
        
        // Here goes the first digit.
        if output3 == nil && text3 == "" {
            output3 = number
            text3 = "\(String(number))"
        }
        // The rest of the digits.
        else if output3 != nil && text3 != "" {
            text2 = text2 + "\(String(number))"
            output2 = Int(text2)!
        }
        
    }
    
    // Method used in every button (1, 2, 3...).
    func final(number:Int, string:String) {
      
      if toogleEqual == false && error == false {
        // If (+) or (-) are true and (x) or (/) are true as well, it will write the number in OUTPUT3 to give priority to (x) and (/).
        if (tooglePlus == true || toogleMinus == true) && (toogleMoltiplication == true || toogleDivision == true) {
            addNumber2(number: number)
        }
        // If one of the operation signs [(+), (-), (x), (/)] are true, it will write the number in OUTPUT2 because it's the second number.
        else if (tooglePlus == true || toogleMinus == true || toogleMoltiplication == true || toogleDivision == true)  {
            addNumber1(number: number)
        }
        // It's the first number so it will write the number in OUTPUT.
        else {
            addNumber(number: number)
        }
      }
      // In this case, toogleEqual is true, so if you try to insert a number it will erase everything
      else {
        output = number
        text = string
        output2 = nil
        text2 = ""
        output3 = nil
        text3 = ""
        total = nil
        tooglePlus = false
        toogleMinus = false
        toogleMoltiplication = false
        toogleDivision = false
        toogleEqual = false
        error = false
      }
        
    }
    
    // This method make TOTAL the sum of two numbers.
    func add(number1:Int, number2:Int) {
        
        total = number1 + number2

        output2 = nil
        text2 = ""
        output = Int(total!)
        
    }
    
    // This method make TOTAL the first number minus the second.
    func subtract(number1:Int, number2:Int) {
        
        total = number1 - number2
        
        output2 = nil
        text2 = ""
        output = Int(total!)
        
    }
    
    // This method multiply the two numbers in TOTAL.
    func multiply(number1:Int, number2:Int) {
        
        total = number1 * number2
        
        output2 = nil
        text2 = ""
        output = Int(total!)
    }
    
    // This method divide the two numbers in TOTAL.
    func divide(number1:Int, number2:Int) {
      if number2 != 0 {
        total = number1 / number2
        
        output2 = nil
        text2 = ""
        output = Int(total!)
      }
      else {
        error = true
      }
        
    }
    
    // This method is used in three buttons (plus, minus and equal).
    func PlusMinusEqual() {
        
        if (tooglePlus == true || toogleMinus == true) && (toogleMoltiplication == true || toogleDivision == true) {
            if tooglePlus == true && toogleMoltiplication == true {
                if output != nil && output2 != nil && output3 != nil {
                add(number1: output!, number2: output2! * output3!)
                output3 = nil
                text3 = ""
                }
                else {
                    erase()
                }
            }
            else if tooglePlus == true && toogleDivision == true {
                if output != nil && output2 != nil && output3 != nil {
                if output3 != 0 {
                add(number1: output!, number2: output2! / output3!)
                output3 = nil
                text3 = ""
                }
                else {
                    error = true
                }
                }
                else {
                    erase()
                }
            }
            else if toogleMinus == true && toogleMoltiplication == true {
                if output != nil && output2 != nil && output3 != nil {
                subtract(number1: output!, number2: output2! * output3!)
                output3 = nil
                text3 = ""
                }
                else {
                    erase()
                }
            }
            else if toogleMinus == true && toogleDivision == true {
                if output != nil && output2 != nil && output3 != nil {
                if output3 != 0 {
                subtract(number1: output!, number2: output2! / output3!)
                output3 = nil
                text3 = ""
                }
                else {
                    error = true
                }
                }
                else {
                    erase()
                }
            }
        }
        else if output2 != nil && tooglePlus == true {
            if output != nil {
                add(number1:output!, number2:output2!)
            }
            else {
                add(number1:0, number2:output2!)
            }
        }
        else if output2 != nil && toogleMinus == true {
            if output != nil {
                subtract(number1:output!, number2:output2!)
            }
            else {
                subtract(number1:0, number2:output2!)
            }
        }
        else if output2 != nil && toogleMoltiplication == true {
            if output != nil {
                multiply(number1:output!, number2:output2!)
                output2 = nil
                text2 = ""
                output = Int(total!)
            }
            else {
                multiply(number1:0, number2:output2!)
                output2 = nil
                text2 = ""
                output = Int(total!)
            }
        }
        else if output2 != nil && toogleDivision == true {
            if output != nil {
                divide(number1:output!, number2:output2!)
            }
            else {
                divide(number1:0, number2:output2!)
            }
        }
        else {
            if output != nil {
            total = output!
            }
        }
        
    }
    
    func MultiplyDivide() {
        
        if output != nil && output2 != nil {
            if toogleMoltiplication == true {
                multiply(number1: output!, number2: output2!)
            }
            else if toogleDivision == true {
                divide(number1: output!, number2: output2!)
            }
        }
        else if output3 != nil && toogleMoltiplication == true {
            multiply(number1: output2!, number2: output3!)
            output3 = nil
            text3 = ""
            output2 = Int(total!)
        }
        else if output3 != nil && toogleDivision == true {
            divide(number1: output2!, number2: output3!)
            output3 = nil
            text3 = ""
            output2 = Int(total!)
        }
        
    }
    
    func erase() {
        output = nil
        text = ""
        output2 = nil
        text2 = ""
        output3 = nil
        text3 = ""
        total = nil
        tooglePlus = false
        toogleMinus = false
        toogleMoltiplication = false
        toogleDivision = false
        toogleEqual = false
        error = false
    }
    
 
    
var body: some View {
      
       
    ZStack {
        
        Image("background")
        
        VStack {
            Spacer()
            VStack {
                
                Spacer()
                        VStack {

                            Spacer()
                            
                            HStack {
                            
                            if error == true {
                                Text("Error")
                                    .font(.title)
                                    .foregroundColor(Color.white)
                                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                                    .frame(width: 300.0, height: 180.0)
                                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.green/*@END_MENU_TOKEN@*/)
                                    .cornerRadius(60.0)
                            }
                            else if output3 != nil {
                                Text("\(output3!)")
                                    .font(.title)
                                    .foregroundColor(Color.white)
                                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                                    .frame(width: 300.0, height: 180.0)
                                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.green/*@END_MENU_TOKEN@*/)
                                    .cornerRadius(60.0)
                            }
                            else if total != nil && output != total {
                                Text("\(total!)")
                                    .font(.title)
                                    .foregroundColor(Color.white)
                                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                                    .frame(width: 300.0, height: 180.0)
                                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.green/*@END_MENU_TOKEN@*/)
                                    .cornerRadius(60.0)
                            }
                            else if output2 != nil {
                                Text("\(output2!)")
                                   .font(.title)
                                    .foregroundColor(Color.white)
                                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                                    .frame(width: 300.0, height: 180.0)
                                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.green/*@END_MENU_TOKEN@*/)
                                    .cornerRadius(60.0)
                            }
                            else if output != nil {
                                Text("\(output!)")
                                   .font(.title)
                                    .foregroundColor(Color.white)
                                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                                    .frame(width: 300.0, height: 180.0)
                                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.green/*@END_MENU_TOKEN@*/)
                                    .cornerRadius(60.0)
                            }
                            else if output == nil {
                                Text("0")
                                    .font(.title)
                                    .foregroundColor(Color.white)
                                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                                    .frame(width: 300.0, height: 180.0)
                                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.green/*@END_MENU_TOKEN@*/)
                                    .cornerRadius(60.0)
                            }
                        
                        }
                            
                     }
                        
                        
                        
                        
                      VStack {
                            
                        
                            
                         HStack {
                            
                            Spacer()
                                
                                Button(action: {
                                    
                                    final(number: 7, string: "7")
                                    
                                }, label: {
                                    Text("7")
                                        .font(.title)
                                        .foregroundColor(Color.white)
                                        .padding(.all)
                                        .frame(width: 85.0, height: 85.0)
                                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                                        .cornerRadius(60.0)
                                })
                                
                            Spacer()
                                
                                Button(action: {
                                    
                                    final(number: 8, string: "8")
                                    
                                }, label: {
                                    Text("8")
                                        .font(.title)
                                        .foregroundColor(Color.white)
                                        .padding(.all)
                                        .frame(width: 85.0, height: 85.0)
                                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                                        .cornerRadius(60.0)
                                })
                                
                            Spacer()
                                
                                 Button(action: {
                                    
                                    final(number: 9, string: "9")
                                    
                                }, label: {
                                    Text("9")
                                        .font(.title)
                                        .foregroundColor(Color.white)
                                        .padding(.all)
                                        .frame(width: 85.0, height: 85.0)
                                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                                        .cornerRadius(60.0)
                                })
                                
                            Spacer()
                            Button(action: {
                                
                              erase()
                                
                            }, label: {
                                Image(systemName: "delete.left.fill")
                                    .font(.title)
                                    .foregroundColor(Color.white)
                                    .padding(.all)
                                    .frame(width: 85.0, height: 85.0)
                                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                                    .cornerRadius(60.0)
                            })
                                
                            Spacer()
                            
                        }
                            
                        }
                        
                        
                        
                        VStack {
                            
                            HStack {
                                
                                Spacer()
                                    
                                    Button(action: {
                                        
                                        final(number: 4, string: "4")
                                        
                                    }, label: {
                                        Text("4")
                                            .font(.title)
                                            .foregroundColor(Color.white)
                                            .padding(.all)
                                            .frame(width: 85.0, height: 85.0)
                                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                                            .cornerRadius(60.0)
                                    })
                                
                                Spacer()
                                    
                                    Button(action: {
                                        
                                        final(number: 5, string: "5")
                                        
                                    }, label: {
                                        Text("5")
                                            .font(.title)
                                            .foregroundColor(Color.white)
                                            .padding(.all)
                                            .frame(width: 85.0, height: 85.0)
                                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                                            .cornerRadius(60.0)
                                    })
                                Spacer()
                                    
                                    Button(action: {
                                        
                                        final(number: 6, string: "6")
                                        
                                    }, label: {
                                        Text("6")
                                            .font(.title)
                                            .foregroundColor(Color.white)
                                            .padding(.all)
                                            .frame(width: 85.0, height: 85.0)
                                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                                            .cornerRadius(60.0)
                                    })
                                Spacer()
                                   
                                Button(action: {
                                    
                                    
                                    PlusMinusEqual()
                                    
                                    toogleEqual = false
                                    tooglePlus = true
                                    toogleMinus = false
                                    toogleMoltiplication = false
                                    toogleDivision = false
                                    
                                }, label: {
                                    if tooglePlus == true {
                                    Image(systemName: "plus")
                                        .font(.title)
                                        .foregroundColor(Color.white)
                                        .padding(.all)
                                        .frame(width: 85.0, height: 85.0)
                                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.orange/*@END_MENU_TOKEN@*/)
                                        .cornerRadius(60.0)
                                    }
                                    else {
                                        Image(systemName: "plus")
                                            .font(.title)
                                            .foregroundColor(Color.white)
                                            .padding(.all)
                                            .frame(width: 85.0, height: 85.0)
                                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                                            .cornerRadius(60.0)
                                    }
                                })
                                
                                Spacer()
                                
                            }
                            
                        }
                            
                        
                            
                        VStack {
                            
                            HStack {
                                
                                HStack{
                                    Spacer()
                                    // Here there are three buttons with a value (1, 2, 3).
                                    Button(action: {
                                        
                                        final(number: 1, string: "1")
                                        
                                    }, label: {
                                        Text("1")
                                            .font(.title)
                                            .foregroundColor(Color.white)
                                            .padding(.all)
                                            .frame(width: 85.0, height: 85.0)
                                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                                            .cornerRadius(60.0)
                                    })
                                    Spacer()
                                    Button(action: {
                                        
                                        final(number: 2, string: "2")
                                        
                                    }, label: {
                                        Text("2")
                                            .font(.title)
                                            .foregroundColor(Color.white)
                                            .padding(.all)
                                            .frame(width: 85.0, height: 85.0)
                                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                                            .cornerRadius(60.0)
                                    })
                                    Spacer()
                                    Button(action: {
                                        
                                        final(number: 3, string: "3")
                                        
                                    }, label: {
                                        Text("3")
                                            .font(.title)
                                            .foregroundColor(Color.white)
                                            .padding(.all)
                                            .frame(width: 85.0, height: 85.0)
                                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                                            .cornerRadius(60.0)
                                    })
                                    Spacer()
                                    Button(action: {
                                        
                                        PlusMinusEqual()
                                        
                                        toogleEqual = false
                                        toogleMinus = true
                                        tooglePlus = false
                                        toogleMoltiplication = false
                                        toogleDivision = false
                                       
                                        
                                    }, label: {
                                        if toogleMinus == true {
                                        Image(systemName: "minus")
                                            .font(.title)
                                            .foregroundColor(Color.white)
                                            .padding(.all)
                                            .frame(width: 85.0, height: 85.0)
                                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.orange/*@END_MENU_TOKEN@*/)
                                            .cornerRadius(60.0)
                                        }
                                        else {
                                            Image(systemName: "minus")
                                                .font(.title)
                                                .foregroundColor(Color.white)
                                                .padding(.all)
                                                .frame(width: 85.0, height: 85.0)
                                                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                                                .cornerRadius(60.0)
                                        }
                                    })
                                    
                                    Spacer()
                                }
                               
                                
                            }
                            
                        }
                        
                        
                        
                        VStack {
                            
                            HStack {
                               
                                HStack{
                                    Spacer()
                                    // Here there is the button with value 0.
                                    Button(action: {
                                        
                                        final(number: 0, string: "0")
                                        
                                    }, label: {
                                        Text("0")
                                            .font(.title)
                                            .foregroundColor(Color.white)
                                            .padding(.all)
                                            .frame(width: 85.0, height: 85.0)
                                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                                            .cornerRadius(60.0)
                                    })
                                    Spacer()
                                    
                                    Button(action: {
                                        
                                        MultiplyDivide()
                                        
                                        toogleDivision = true
                                        toogleMoltiplication = false
                                        toogleEqual = false
                                        
                                    }, label: {
                                        if toogleDivision == true {
                                        Image(systemName: "divide")
                                            .font(.title)
                                            .foregroundColor(Color.white)
                                            .padding(.all)
                                            .frame(width: 85.0, height: 85.0)
                                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.orange/*@END_MENU_TOKEN@*/)
                                            .cornerRadius(60.0)
                                        }
                                        else {
                                            Image(systemName: "divide")
                                                .font(.title)
                                                .foregroundColor(Color.white)
                                                .padding(.all)
                                                .frame(width: 85.0, height: 85.0)
                                                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                                                .cornerRadius(60.0)
                                        }
                                    })
                                    Spacer()
                                    Button(action: {
                                        
                                        MultiplyDivide()
                                        
                                        toogleMoltiplication = true
                                        toogleDivision = false
                                        toogleEqual = false
                                        
                                    }, label: {
                                        if toogleMoltiplication == true {
                                        Image(systemName: "multiply")
                                            .font(.title)
                                            .foregroundColor(Color.white)
                                            .padding(.all)
                                            .frame(width: 85.0, height: 85.0)
                                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.orange/*@END_MENU_TOKEN@*/)
                                            .cornerRadius(60.0)
                                        }
                                        else {
                                            Image(systemName: "multiply")
                                                .font(.title)
                                                .foregroundColor(Color.white)
                                                .padding(.all)
                                                .frame(width: 85.0, height: 85.0)
                                                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                                                .cornerRadius(60.0)
                                        }
                                    })
                                    Spacer()
                                    Button(action: {
                                       
                                        PlusMinusEqual()
                                        
                                        toogleMinus = false
                                        tooglePlus = false
                                        toogleMoltiplication = false
                                        toogleDivision = false
                                        toogleEqual = true
                                        
                                    }, label: {
                                        Image(systemName: "equal")
                                            .font(.title)
                                            .foregroundColor(Color.white)
                                            .padding(.all)
                                            .frame(width: 85.0, height: 85.0)
                                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                                            .cornerRadius(60.0)
                                    })
                                    
                                    Spacer()
                                }
                            }
                            Spacer()
                        }
                        
                        Spacer()
                        
                        
            }
        }
        Spacer()
    }
            
        }
        
        
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}

