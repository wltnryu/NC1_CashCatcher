//
//  CategoryView.swift
//  NC1_CashCatcher
//
//  Created by 유지수 on 4/13/24.
//

import SwiftUI

struct CategoryView: View {
    
    @State var isForkClicked: Bool = false
    @State var isHealthClicked: Bool = false
    @State var isCelebrateClicked: Bool = false
    @State var isMakeupClicked: Bool = false
    @State var isTicketClicked: Bool = false
    @State var isBusClicked: Bool = false
    @State var isPhoneClicked: Bool = false
    @State var isHouseClicked: Bool = false
    @State var isEduClicked: Bool = false
    
    @State var isClicked: Bool = false
    @Binding var isPresented : Bool
    
    @Environment(\.presentationMode) var presentationMode
    @State var tag : Bool = false
    
    @EnvironmentObject var historyModel : HistoryModel
    @State var selectedCategory: String = ""
    @State var selectedIcon: String = ""
            
    var body: some View {
        
        NavigationView {
            
            VStack {
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "multiply")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.black)
                            .font(.system(size: 24, weight: .light))
                    })
                    .padding(16)
                    
                    Spacer()
                }.padding(.bottom, 19)
                
                HStack {
                    Text("어떤 항목의 지출인가요?")
                        .font(.system(size: 30, weight: .semibold))
                        .foregroundColor(.black)
                        .padding(.leading, 16)
                        .padding(.bottom, 5)
                    Spacer()
                }
                HStack {
                    Text("지출 항목의 카테고리를 정해주세요.")
                        .font(.system(size: 20, weight: .regular))
                        .foregroundColor(Color(hex: 0x9E9E9E))
                        .padding(.leading, 16)
                    Spacer()
                }
                .padding(.bottom, 25)
                
                VStack {
                    HStack {
                        Button(action: {
                            if isForkClicked {
                                isForkClicked = false
                                isClicked = false
                            } else {
                                isForkClicked = true
                                isHealthClicked = false
                                isCelebrateClicked = false
                                isMakeupClicked = false
                                isTicketClicked = false
                                isBusClicked = false
                                isPhoneClicked = false
                                isHouseClicked = false
                                isEduClicked = false
                                isClicked = true
                                
                                selectedCategory = "식사"
                                selectedIcon = "list_fork"
                            }
                        }, label: {
                            ZStack {
                                if isForkClicked {
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color(hex: 0xFF9500), lineWidth: 2)
                                        .frame(width: 100, height: 125)
                                        .foregroundColor(.white)
                                        .shadow(color: Color(hex: 0x000000, opacity: 0.1), radius: 5, x:0, y:0)
                                } else {
                                    RoundedRectangle(cornerRadius: 15)
                                        .frame(width: 100, height: 125)
                                        .foregroundColor(.white)
                                        .shadow(color: Color(hex: 0x000000, opacity: 0.1), radius: 5, x:0, y:0)
                                }
                                
                                VStack {
                                    Image("fork")
                                        .resizable()
                                        .frame(width: 59, height: 59)
                                    
                                    Text("식사")
                                        .font(.system(size: 20, weight: .medium))
                                        .foregroundColor(.black)
                                }
                            }
                        })
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 125)
                        .padding(.trailing, 10)
                        
                        Button(action: {
                            if isHealthClicked {
                                isHealthClicked = false
                                isClicked = false
                            } else {
                                isForkClicked = false
                                isHealthClicked = true
                                isCelebrateClicked = false
                                isMakeupClicked = false
                                isTicketClicked = false
                                isBusClicked = false
                                isPhoneClicked = false
                                isHouseClicked = false
                                isEduClicked = false
                                isClicked = true
                                
                                selectedCategory = "건강"
                                selectedIcon = "list_health"
                            }
                        }, label: {
                            ZStack {
                                if isHealthClicked {
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color(hex: 0xFF9500), lineWidth: 2)
                                        .frame(width: 100, height: 125)
                                        .foregroundColor(.white)
                                        .shadow(color: Color(hex: 0x000000, opacity: 0.1), radius: 5, x:0, y:0)
                                } else {
                                    RoundedRectangle(cornerRadius: 15)
                                        .frame(width: 100, height: 125)
                                        .foregroundColor(.white)
                                        .shadow(color: Color(hex: 0x000000, opacity: 0.1), radius: 5, x:0, y:0)
                                }
                                
                                VStack {
                                    Image("health")
                                        .resizable()
                                        .frame(width: 56, height: 56)
                                    
                                    Text("건강")
                                        .font(.system(size: 20, weight: .medium))
                                        .foregroundColor(.black)
                                }
                            }
                        })
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 125)
                        .padding(.trailing, 10)
                        
                        Button(action: {
                            if isCelebrateClicked {
                                isCelebrateClicked = false
                                isClicked = false
                            } else {
                                isForkClicked = false
                                isHealthClicked = false
                                isCelebrateClicked = true
                                isMakeupClicked = false
                                isTicketClicked = false
                                isBusClicked = false
                                isPhoneClicked = false
                                isHouseClicked = false
                                isEduClicked = false
                                isClicked = true
                                
                                selectedCategory = "유흥"
                                selectedIcon = "list_celebrate"
                            }
                        }, label: {
                            ZStack {
                                if isCelebrateClicked {
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color(hex: 0xFF9500), lineWidth: 2)
                                        .frame(width: 100, height: 125)
                                        .foregroundColor(.white)
                                        .shadow(color: Color(hex: 0x000000, opacity: 0.1), radius: 5, x:0, y:0)
                                } else {
                                    RoundedRectangle(cornerRadius: 15)
                                        .frame(width: 100, height: 125)
                                        .foregroundColor(.white)
                                        .shadow(color: Color(hex: 0x000000, opacity: 0.1), radius: 5, x:0, y:0)
                                }
                                
                                VStack {
                                    Image("celebrate")
                                        .resizable()
                                        .frame(width: 59, height: 59)
                                    
                                    Text("유흥")
                                        .font(.system(size: 20, weight: .medium))
                                        .foregroundColor(.black)
                                }
                            }
                        })
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 125)
                    }
                }.padding(.bottom, 16)
                
                VStack {
                    HStack {
                        Button(action: {
                            if isMakeupClicked {
                                isMakeupClicked = false
                                isClicked = false
                            } else {
                                isForkClicked = false
                                isHealthClicked = false
                                isCelebrateClicked = false
                                isMakeupClicked = true
                                isTicketClicked = false
                                isBusClicked = false
                                isPhoneClicked = false
                                isHouseClicked = false
                                isEduClicked = false
                                isClicked = true
                                
                                selectedCategory = "미용"
                                selectedIcon = "list_makeup"
                            }
                        }, label: {
                            ZStack {
                                if isMakeupClicked {
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color(hex: 0xFF9500), lineWidth: 2)
                                        .frame(width: 100, height: 125)
                                        .foregroundColor(.white)
                                        .shadow(color: Color(hex: 0x000000, opacity: 0.1), radius: 5, x:0, y:0)
                                } else {
                                    RoundedRectangle(cornerRadius: 15)
                                        .frame(width: 100, height: 125)
                                        .foregroundColor(.white)
                                        .shadow(color: Color(hex: 0x000000, opacity: 0.1), radius: 5, x:0, y:0)
                                }
                                
                                VStack {
                                    Image("makeup")
                                        .resizable()
                                        .frame(width: 63, height: 59)
                                    
                                    Text("미용")
                                        .font(.system(size: 20, weight: .medium))
                                        .foregroundColor(.black)
                                }
                            }
                        })
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 125)
                        .padding(.trailing, 10)
                        
                        Button(action: {
                            if isTicketClicked {
                                isTicketClicked = false
                                isClicked = false
                            } else {
                                isForkClicked = false
                                isHealthClicked = false
                                isCelebrateClicked = false
                                isMakeupClicked = false
                                isTicketClicked = true
                                isBusClicked = false
                                isPhoneClicked = false
                                isHouseClicked = false
                                isEduClicked = false
                                isClicked = true
                                
                                selectedCategory = "문화"
                                selectedIcon = "list_ticket"
                            }
                        }, label: {
                            ZStack {
                                if isTicketClicked {
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color(hex: 0xFF9500), lineWidth: 2)
                                        .frame(width: 100, height: 125)
                                        .foregroundColor(.white)
                                        .shadow(color: Color(hex: 0x000000, opacity: 0.1), radius: 5, x:0, y:0)
                                } else {
                                    RoundedRectangle(cornerRadius: 15)
                                        .frame(width: 100, height: 125)
                                        .foregroundColor(.white)
                                        .shadow(color: Color(hex: 0x000000, opacity: 0.1), radius: 5, x:0, y:0)
                                }
                                
                                VStack {
                                    Image("ticket")
                                        .resizable()
                                        .frame(width: 59, height: 59)
                                    
                                    Text("문화")
                                        .font(.system(size: 20, weight: .medium))
                                        .foregroundColor(.black)
                                }
                            }
                        })
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 125)
                        .padding(.trailing, 10)
                        
                        Button(action: {
                            if isBusClicked {
                                isBusClicked = false
                                isClicked = false
                            } else {
                                isForkClicked = false
                                isHealthClicked = false
                                isCelebrateClicked = false
                                isMakeupClicked = false
                                isTicketClicked = false
                                isBusClicked = true
                                isPhoneClicked = false
                                isHouseClicked = false
                                isEduClicked = false
                                isClicked = true
                                
                                selectedCategory = "교통"
                                selectedIcon = "list_bus"
                            }
                        }, label: {
                            ZStack {
                                if isBusClicked {
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color(hex: 0xFF9500), lineWidth: 2)
                                        .frame(width: 100, height: 125)
                                        .foregroundColor(.white)
                                        .shadow(color: Color(hex: 0x000000, opacity: 0.1), radius: 5, x:0, y:0)
                                } else {
                                    RoundedRectangle(cornerRadius: 15)
                                        .frame(width: 100, height: 125)
                                        .foregroundColor(.white)
                                        .shadow(color: Color(hex: 0x000000, opacity: 0.1), radius: 5, x:0, y:0)
                                }
                                
                                VStack {
                                    Image("bus")
                                        .resizable()
                                        .frame(width: 59, height: 59)
                                    
                                    Text("교통")
                                        .font(.system(size: 20, weight: .medium))
                                        .foregroundColor(.black)
                                }
                            }
                        })
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 125)
                    }
                }
                .padding(.bottom, 16)
                
                VStack {
                    HStack {
                        Button(action: {
                            if isPhoneClicked {
                                isPhoneClicked = false
                                isClicked = false
                            } else {
                                isForkClicked = false
                                isHealthClicked = false
                                isCelebrateClicked = false
                                isMakeupClicked = false
                                isTicketClicked = false
                                isBusClicked = false
                                isPhoneClicked = true
                                isHouseClicked = false
                                isEduClicked = false
                                isClicked = true
                                
                                selectedCategory = "통신"
                                selectedIcon = "list_phone"
                            }
                        }, label: {
                            ZStack {
                                if isPhoneClicked {
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color(hex: 0xFF9500), lineWidth: 2)
                                        .frame(width: 100, height: 125)
                                        .foregroundColor(.white)
                                        .shadow(color: Color(hex: 0x000000, opacity: 0.1), radius: 5, x:0, y:0)
                                } else {
                                    RoundedRectangle(cornerRadius: 15)
                                        .frame(width: 100, height: 125)
                                        .foregroundColor(.white)
                                        .shadow(color: Color(hex: 0x000000, opacity: 0.1), radius: 5, x:0, y:0)
                                }
                                
                                VStack {
                                    Image("phone")
                                        .resizable()
                                        .frame(width: 59, height: 59)
                                    
                                    Text("통신")
                                        .font(.system(size: 20, weight: .medium))
                                        .foregroundColor(.black)
                                }
                            }
                        })
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 125)
                        .padding(.trailing, 10)
                        
                        Button(action: {
                            if isHouseClicked {
                                isHouseClicked = false
                                isClicked = false
                            } else {
                                isForkClicked = false
                                isHealthClicked = false
                                isCelebrateClicked = false
                                isMakeupClicked = false
                                isTicketClicked = false
                                isBusClicked = false
                                isPhoneClicked = false
                                isHouseClicked = true
                                isEduClicked = false
                                isClicked = true
                                
                                selectedCategory = "생활"
                                selectedIcon = "list_house"
                            }
                        }, label: {
                            ZStack {
                                if isHouseClicked {
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color(hex: 0xFF9500), lineWidth: 2)
                                        .frame(width: 100, height: 125)
                                        .foregroundColor(.white)
                                        .shadow(color: Color(hex: 0x000000, opacity: 0.1), radius: 5, x:0, y:0)
                                } else {
                                    RoundedRectangle(cornerRadius: 15)
                                        .frame(width: 100, height: 125)
                                        .foregroundColor(.white)
                                        .shadow(color: Color(hex: 0x000000, opacity: 0.1), radius: 5, x:0, y:0)
                                }
                                
                                VStack {
                                    Image("house")
                                        .resizable()
                                        .frame(width: 59, height: 59)
                                    
                                    Text("생활")
                                        .font(.system(size: 20, weight: .medium))
                                        .foregroundColor(.black)
                                }
                            }
                        })
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 125)
                        .padding(.trailing, 10)
                        
                        Button(action: {
                            if isEduClicked {
                                isEduClicked = false
                                isClicked = false
                            } else {
                                isForkClicked = false
                                isHealthClicked = false
                                isCelebrateClicked = false
                                isMakeupClicked = false
                                isTicketClicked = false
                                isBusClicked = false
                                isPhoneClicked = false
                                isHouseClicked = false
                                isEduClicked = true
                                isClicked = true
                                
                                selectedCategory = "교육"
                                selectedIcon = "list_graduation"
                            }
                        }, label: {
                            ZStack {
                                if isEduClicked {
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color(hex: 0xFF9500), lineWidth: 2)
                                        .frame(width: 100, height: 125)
                                        .foregroundColor(.white)
                                        .shadow(color: Color(hex: 0x000000, opacity: 0.1), radius: 5, x:0, y:0)
                                } else {
                                    RoundedRectangle(cornerRadius: 15)
                                        .frame(width: 100, height: 125)
                                        .foregroundColor(.white)
                                        .shadow(color: Color(hex: 0x000000, opacity: 0.1), radius: 5, x:0, y:0)
                                }
                                
                                VStack {
                                    Image("graduation")
                                        .resizable()
                                        .frame(width: 59, height: 59)
                                    
                                    Text("교육")
                                        .font(.system(size: 20, weight: .medium))
                                        .foregroundColor(.black)
                                }
                            }
                        })
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 125)
                    }
                }
                
                Spacer()
                
                ZStack{
                    NavigationLink(destination: SpendView(isPresented: $isPresented), isActive: $tag) {
                        EmptyView()
                    }.navigationTitle("")
                }
                
                Button(action: {
                    
                    if isClicked {
                        self.tag = true
                    }
                    
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 361, height: 67)
                            .foregroundColor(Color(hex: 0xFF9500))
                        
                        Text("다음")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                    }
                })
                
            }
            .onChange(of: selectedCategory) { newValue in
                historyModel.category = selectedCategory
                historyModel.icon = selectedIcon
            }
        }.accentColor(.black)
        .navigationViewStyle(.stack) 
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        let historyModel = HistoryModel()
        CategoryView(isPresented: .constant(true)).environmentObject(historyModel)
    }
}

