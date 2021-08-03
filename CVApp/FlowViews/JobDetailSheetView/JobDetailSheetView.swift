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
                        .foregroundColor(Color(UIColor.label))
                })
                    .padding(.trailing, 20)
                    .padding(.top, 10)
            }
            VStack {
                Text(job?.position ?? "")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                    .foregroundColor(Color(UIColor.systemIndigo))
                Text(job?.name ?? "")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 16, weight: .medium, design: .rounded))
                    .foregroundColor(Color(UIColor.label))
                Text((job?.dateStart ?? "") + " - " + (job?.dateEnd ?? ""))
                    .multilineTextAlignment(.center)
                    .font(.system(size: 14, weight: .medium, design: .rounded))
                    .foregroundColor(Color(UIColor.secondaryLabel))
                    .padding(.top, 2)
            }
            
            Divider()

            Text("Descripcion")
                .frame(width: UIScreen.main.bounds.width*0.9, alignment: .leading)
                .padding(.top, 20)
                .font(.system(size: 14, weight: .bold, design: .rounded))
                .foregroundColor(Color(UIColor.systemIndigo))
            ScrollView(.vertical) {
                Text(job?.description ?? "")
                    .frame(width: UIScreen.main.bounds.width*0.90, alignment: .leading)
                    .font(.system(size: 14, weight: .medium, design: .rounded))
                    .foregroundColor(Color(UIColor.label))
                    .padding()
            }
            .background(Color(UIColor.secondarySystemBackground))
            .frame(width: UIScreen.main.bounds.width*0.98)
            .cornerRadius(10)
        }
    }
}

struct JobDetailSheetView_Previews: PreviewProvider {
    @State static var job: Job? = Job(type: .auditor, name: "Fluxit", position: "ios dev", dateStart: "asfdkj", dateEnd: "fksadjg", description: "osjgdknfgbahkdnfloigjwlnksghawbglkjawgg waeuigju ghairuwh uiarh uiahu huhguha gruiai hiaegosjgdknfgbahkdnfloigjwlnksghawbglkjawgg waeuigju ghairuwh uiarh uiahu huhguha gruiai hiaegosjgdknfgbahkdnfloigjwlnksghawbglkjawgg waeuigju ghairuwh uiarh uiahu huhguha gruiai hiaegosjgdknfgbahkdnfloigjwlnksghawbglkjawgg waeuigju ghairuwh uiarh uiahu huhguha gruiai hiaegosjgdknfgbahkdnfloigjwlnksghawbglkjawgg waeuigju ghairuwh uiarh uiahu huhguha gruiai hiaegosjgdknfgbahkdnfloigjwlnksghawbglkjawgg waeuigju ghairuwh uiarh uiahu huhguha gruiai hiaegosjgdknfgbahkdnfloigjwlnksghawbglkjawgg waeuigju ghairuwh uiarh uiahu huhguha gruiai hiaegosjgdknfgbahkdnfloigjwlnksghawbglkjawgg waeuigju ghairuwh uiarh uiahu huhguha gruiai hiaegosjgdknfgbahkdnfloigjwlnksghawbglkjawgg waeuigju ghairuwh uiarh uiahu huhguha gruiai hiaegosjgdknfgbahkdnfloigjwlnksghawbglkjawgg waeuigju ghairuwh uiarh uiahu huhguha gruiai hiaegosjgdknfgbahkdnfloigjwlnksghawbglkjawgg waeuigju ghairuwh uiarh uiahu huhguha gruiai hiaeg")
    static var previews: some View {
        JobDetailSheetView(job: $job)
    }
}
