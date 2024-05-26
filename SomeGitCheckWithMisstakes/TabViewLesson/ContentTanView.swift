//
//  ContentTanView.swift
//  SomeGitCheckWithMisstakes
//
//  Created by vladimir gennadievich on 25.05.2024.
//

import SwiftUI
import UIKit

struct ContentTanView: View {
    @State private var activTab:DummyTab = .home
    var offsetObserver = PageOffsetObserver()
    
    var body: some View {
        VStack(spacing:15) {
            
            TabBar(.gray)
                .overlay {
                    if let collectionView = offsetObserver.collectionView?.bounds {

                    GeometryReader {
                        let width = $0.size.width
                        let tabCount = CGFloat(DummyTab.allCases.count)
                        let cupsulaWidth = width / tabCount
                        let progress = offsetObserver.offset / collectionView.width
                        
                        Capsule()
                            .fill(.black)
                            .frame(width:cupsulaWidth)
                            .offset(x:progress * cupsulaWidth)
                        
                        TabBar(.white,.semibold)
                            .mask(alignment: .leading) {
                                Capsule()
                                    .frame(width:cupsulaWidth)
                                    .offset(x:progress * cupsulaWidth)
                        }
                    }
                }
            }
                .background(.ultraThinMaterial)
                .clipShape(.capsule)
                .shadow (color: .black.opacity(0.1),radius: 5, x: 5,y: 5)
                .shadow(color:.black.opacity(0.05), radius: -5,x: -5,y: -5)
                .padding([.horizontal,.top],15)
            
            TabView(selection: $activTab) {
                DummyTab.home.color
                    .tag(DummyTab.home)
                    .background {
                        if !offsetObserver.isObserving {
                            FindCollectionView { collection in
                                offsetObserver.collectionView = collection
                                offsetObserver.observe()
                            }
                        }
                    }
                
                DummyTab.charts.color
                    .tag(DummyTab.charts)
                
                
                
                DummyTab.calls.color
                    .tag(DummyTab.calls)
                
                DummyTab.settings.color
                    .tag(DummyTab.settings)
                
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
    }
    
    @ViewBuilder
    func TabBar(_ tint:Color, _ weight:Font.Weight = .regular) -> some View {
        HStack(spacing:0) {
            ForEach(DummyTab.allCases,id:\.rawValue) { dammy in
                Text(dammy.rawValue)
                    .font(.callout)
                    .fontWeight(weight)
                    .foregroundStyle(tint)
                    .padding(.vertical,10)
                    .frame(maxWidth:.infinity)
                    .contentShape(.rect)
                    .onTapGesture {
                        withAnimation(.snappy(duration: 0.3,extraBounce: 0)) {
                            activTab = dammy
                        }
                    }
            }
        }
    }
}

#Preview {
    ContentTanView()
}

@Observable
class PageOffsetObserver:NSObject {
    
    var collectionView:UICollectionView?
    var offset:CGFloat = 0
    
    private(set) var isObserving:Bool = false
    
    deinit {
        remove()
    }
    
    func observe() {
        guard !isObserving else {return}
        collectionView?.addObserver(self, forKeyPath: "contentOffset", context: nil)
        isObserving = true
    }
    
    func remove() {
        isObserving = false
        collectionView?.removeObserver(self, forKeyPath: "contentOffset")
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard keyPath == "contentOffset" else {return}
        if let contentOffset = (object as? UICollectionView)?.contentOffset {
            offset = contentOffset.x
        }
    }
    
}

struct FindCollectionView:UIViewRepresentable {
    var result:(UICollectionView) -> ()
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            if let colletionView = view.colletionSuperView {
                result(colletionView)
            }
        }
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}

extension UIView {
    var colletionSuperView:UICollectionView?  {
        if let colletctionView = superview as? UICollectionView {
            return colletctionView
        }
        
        return superview?.colletionSuperView
    }
}
