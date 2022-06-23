//
//  FeedbackView.swift
//  Dealer
//
//  Created by Владимир Свиридов on 27.03.2022.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore
// экран с формой обратной свяязи
struct FeedbackView: View {
    
    let viewModel = FeedbackViewViewModel()
    
    let title: String
    var description: String?
    var image: String?
    var service: String
    @State var fio: String = ""
    @State var phone: String = ""
    @State var email: String = ""
    @State var message: String = ""
    @State var selectedPickerIndex = 0
    var models: [String] = ["Выберите модель","Accent","Elantra", "Santa Fe", "Tucson", "Palisade","Creta","Staria","Sonata"]
    @State private var isAgree = false
    @State private var sendStatusString: String = ""
    @State private var sendStatusStringColor: Color = .green
    var buttonAction: () -> Void
    
    func createRequest() -> ClientRequest {
        let clientRequest: ClientRequest = ClientRequest(id: Auth.auth().currentUser?.uid ?? "",
                                                         fullName: fio,
                                                         phone: phone,
                                                         email: email,
                                                         car: selectedPickerIndex,
                                                         message: message,
                                                         date: Timestamp(),
                                                         service: service)
        
        return clientRequest
    }
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var backButton : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
            Image(systemName: "chevron.left")
                .font(Font.system(size: 17, weight: .semibold))
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.blue)
                Text("Назад")
            }
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0){
                
                VStack(){
                    if let description = description {
                        Text(description)
                            .font(.system(size: 24, weight: .thin, design: .default))
                            .padding()
                        
                        if let image = image {
                            Image(image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: UIScreen.screenWidth - 20, height: UIScreen.screenWidth/2)
                        }
                    }
                    
                    Text("Напишите нам")
                        .font(.system(size: 20, weight: .light, design: .default))
                    Text("Если у Вас возникли вопросы или предложения, пожалуйста, напишите нам, мы обязательно с Вами свяжемся!")
                        .multilineTextAlignment(.center)
                        .padding()
                }
                
                VStack(spacing: -15){
                    HStack(){
                        Text("Введите ФИО")
                            .font(.system(size: 12, weight: .light, design: .default))
                            .padding(.leading, 25)
                        Text("*")
                            .font(.system(size: 12, weight: .light, design: .default))
                            .padding(.leading, -5)
                            .foregroundColor(.blue)
                        Spacer()
                    }
                    TextField("ФИО", text: $fio)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                }
                
                VStack(spacing: -15){
                    HStack(){
                        Text("Введите телефон")
                            .font(.system(size: 12, weight: .light, design: .default))
                            .padding(.leading, 25)
                        Text("*")
                            .font(.system(size: 12, weight: .light, design: .default))
                            .padding(.leading, -5)
                            .foregroundColor(.blue)
                        Spacer()
                    }
                    
                    TextField("Контактный телефон", text: $phone)
                        .textFieldStyle(.roundedBorder).padding()
                }
                
                VStack(spacing: -15){
                    HStack(){
                        Text("Введите E-mail")
                            .font(.system(size: 12, weight: .light, design: .default))
                            .padding(.leading, 25)
                        
                        Spacer()
                    }
                    
                    TextField("Ваш email", text: $email)
                        .textFieldStyle(.roundedBorder).padding()
                }
                
                Text("Модель автомобиля")
                Picker("Модель автомобиля:", selection: $selectedPickerIndex, content: {
                    
                    ForEach(Array(models.enumerated()), id: \.offset) { index, element in
                        Text(element)
                    }
                })
                
                
                PlaceholderTextEditor(placeholder: "Ваше сообщение", text: $message)
                    .frame(width: UIScreen.screenWidth - 20, height: 200)
                    .padding()
                
                Toggle("Я согласен на сбор и обработку моих личных данных.", isOn: $isAgree)
                    .padding()
                
                DefaultButton(width: 220, height: 50, text: "Отправить") {
                    
                    if isAgree, !fio.isEmpty, !phone.isEmpty {
                        print("Отправлено")
                        sendStatusString = "Отправлено"
                        sendStatusStringColor = .green
                        
                        viewModel.createClientRequest(model: createRequest())
                        print(createRequest())
                        self.buttonAction()
                    }
                    else{
                        sendStatusString = "Заполните необходимые поля и подтвердите согласие на обработку личных данных"
                        sendStatusStringColor = .red
                    }
                    
                }
                .navigationTitle(title)
                
                Text(sendStatusString)
                    .padding()
                    .foregroundColor(sendStatusStringColor)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
}

struct FeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackView(title: "Обратная связь", service: "Запись на сервис") {
            
        }
    }
}
