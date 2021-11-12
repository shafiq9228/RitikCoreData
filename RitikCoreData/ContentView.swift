//
//  ContentView.swift
//  RitikCoreData
//
//  Created by MD SHAFIQ PATEL on 12/11/21.
//

import SwiftUI

struct ContentView: View {
        @Environment(\.managedObjectContext) private var viewContext

       @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Students.id, ascending: false)]) private var myresult:FetchedResults<Students>
    
     @State var name = "shafiq"
     @State var email = "hgjvmhB@gmail.com"
     @State var mobile = "987654"
    
    let date = Date()
    
    var body: some View {
        VStack{
            
            
            Text("\(date, formatter: MyDateFormat())")
            VStack{
                TextField("Enter Name", text: $name)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width-50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                TextField("Enter Email", text: $email)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width-50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                TextField("Enter Mobile", text: $mobile)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width-50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                Button(action: {
                    AddData()
                }, label: {
                    Text("Add Data")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                })
            }
            
           
            List() {
                ForEach(myresult){ item in
                    VStack{
                        Text("\(item.name ?? "no vlaue")")
                        Text("\(item.email  ?? "no vlaue") ")
                        Text("\(item.id!, formatter: MyDateFormat()) ")
                    }
                    .frame(width: UIScreen.main.bounds.width, alignment: .center)
                    .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                  
                }.onDelete(perform: DeleteObj)
            }
            
            Spacer()
        }
    }
    
    func DeleteObj(offset: IndexSet){

    offset.map{myresult[$0]}.forEach(viewContext.delete)
            SaveObject()

        }
    
    func AddData(){
        let obj = Students(context: viewContext)

                obj.id = Date()
                obj.name = name
                obj.email = email
                obj.mobile = mobile
                SaveObject()
    }
    
    func SaveObject()  {
        do{
            try viewContext.save()
            
            name = "name"
            email = "email@gmail.com"
            mobile = "987654"
            
          } catch{
            let error = error as NSError
            fatalError("Unresolved error \(error)")
        }
    }
    
    func MyDateFormat() ->DateFormatter{
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "dd-MMM-YYYY hh:mm:ss"
            return dateformatter

        }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
