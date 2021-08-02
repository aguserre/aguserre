//
//  JobDetailSheetView.swift
//  CVApp
//
//  Created by Agustin Errecalde on 01/08/2021.
//

import SwiftUI

struct JobDetailSheetView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var job: Job?

    var body: some View {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                            .foregroundColor(Color.black)
                    }).padding()
                }
                HStack {
                    TitleWithDescriptionView(title: job?.name ?? "", subtitle: job?.position ?? "", alignment: .center)
                }
            ScrollView(.vertical) {

                HStack {
                    TitleWithDescriptionView(description: job?.description ?? "", alignment: .leading)
                }.padding()
                Spacer()
            }
        }
    }
}

struct JobDetailSheetView_Previews: PreviewProvider {
    @State static var job: Job? = Job(type: .auditor, name: "Fluxit", position: "ios dev", dateStart: "asfdkj", dateEnd: "fksadjg", description: "askfdlgñ")
    static var previews: some View {
        JobDetailSheetView(job: $job)
    }
}
