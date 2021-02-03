//
//  ContentView.swift
//  TestDecimilKeyboard WatchKit Extension
//
//  Created by Ian Applebaum on 2/2/21.
//

import SwiftUI

struct DigiTextView: View {
	@State var text: String = "PlaceHolder"
	@State var presentingModal = false
	var body: some View{
		Button(action: {
			presentingModal.toggle()
		}) {
			Text(text)
		}.buttonStyle(PlainButtonStyle())
		.sheet(isPresented: $presentingModal, content: {
			EnteredText(text: $text, presentedAsModal: $presentingModal)
		})
	}
}
struct EnteredText: View {
	@Binding var text:String
	@Binding var presentedAsModal: Bool
	
	var body: some View{
		VStack(alignment: .trailing) {
			Spacer()
			Spacer()
			Button(action: {
				presentedAsModal.toggle()
			}) {
				Text("Enter")
			}
			.buttonStyle(PlainButtonStyle())
			.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
			
			Button(action:{
				presentedAsModal.toggle()
			}){
				Text(text)
			}
			.buttonStyle(PlainButtonStyle())
			.multilineTextAlignment(.trailing)
			.lineLimit(1)
			.frame(width: 160, height: 15, alignment: .trailing)
				
			DigetPadView(text: $text)
		}
//		.edgesIgnoringSafeArea(.all
//		)
		
	}
}
struct DigetPadView: View {
	var widthSpace: CGFloat = 4.0
	@Binding var text:String
	var body: some View {
		VStack(spacing: 5) {
			HStack(spacing: widthSpace){
				Button(action: {
					text.append("1")
				}) {
					Text("1")
						.padding(0)
				}
				.digitKeyFrame()
				Button(action: {
					text.append("2")
				}) {
					Text("2")
				}.digitKeyFrame()
				
				Button(action: {
					text.append("3")
				}) {
							Text("3")
						}.digitKeyFrame()
			}
			HStack(spacing:widthSpace){
				Button(action: {
					text.append("4")
				}) {
					Text("4")
				}.digitKeyFrame()
				Button(action: {
					text.append("5")
				}) {
					Text("5")
				}.digitKeyFrame()
				
				Button(action: {
					text.append("6")
				}) {
					Text("6")
				}.digitKeyFrame()
			}
			
			HStack(spacing:widthSpace){
				Button(action: {
					text.append("7")
				}) {
					Text("7")
				}.digitKeyFrame()
				Button(action: {
					text.append("8")
				}) {
					Text("8")
				}.digitKeyFrame()
				
				Button(action: {
					text.append("9")
				}) {
					Text("9")
				}
				.digitKeyFrame()
			}
			HStack(spacing:widthSpace) {
				Button(action: {
					if !text.contains("."){
						if text == ""{
							text.append("0.")
						}else{
							text.append(".")
						}
					}
				}) {
					Text("•")
				}
				.digitKeyFrame()
				Button(action: {
					text.append("0")
				}) {
					Text("0")
				}
				.digitKeyFrame()
				
				Button(action: {
					if let last = text.indices.last{
						text.remove(at: last)
					}
				}) {
					Image(systemName: "delete.left")
				}
				.digitKeyFrame()
				//
			}
			
			
			//				.padding()
		}
//		.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
		//		.padding(10.0)
		//		.frame(width: 150.0, height: 50.0)
	}
}


//struct DigetView_Previews: PreviewProvider {
//	static var previews: some View {
////		DigetPadView( text: "b")
//	}
//}

struct EnteredText_Previews: PreviewProvider {
	static var previews: some View {
		EnteredText( text: .constant(""), presentedAsModal: .constant(true))
	}
}

struct Content_View_Previews: PreviewProvider {
	static var previews: some View{
		DigiTextView()
	}
}
