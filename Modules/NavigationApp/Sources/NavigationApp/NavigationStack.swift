//
//  NavigationStack.swift
//  
//
//  Created by Павел Пономарёв on 09.10.2023.
//

import SwiftUI

public struct NavigationStackApp<Content>: View where Content:View {
    @StateObject var viewModel:NavigationStackViewModel = .init()
    public let content:Content
    
    public init(@ViewBuilder content:@escaping () -> Content){
        self.content = content()
    }
    
    public var body: some View {
        let isRoot = viewModel.current == nil
        return ZStack{
            switch isRoot {
            case true:
                content
                    .environmentObject(viewModel)
                    .transition(.moveToFade)
            default:
                viewModel.current!.nextScreen
                    .environmentObject(viewModel)
                    .transition(.moveToFade)
            }
        }
    }
}


public struct NavigationPushButton<Content,Destination>: View where Content:View,Destination:View {
    @EnvironmentObject var  viewModel:NavigationStackViewModel
    public let content:Content
    public let destination:Destination
    public init(destination:Destination,
        @ViewBuilder content:@escaping () -> Content){
        self.content = content()
        self.destination = destination
    }
    
    public var body: some View {
        content.onTapGesture{
            
            viewModel.push(destination)
        }
    }
}

public struct NavigationPushButtonCustomAnimation<Content,Destination>: View where Content:View,Destination:View {

    
    @EnvironmentObject var  viewModel:NavigationStackViewModel
    public let content:Content
    public let destination:Destination
    public let animation:Animation
    public let duration:Double
    @Binding var isAnimate: Bool
    
    public init(destination:Destination,
                @ViewBuilder content:@escaping () -> Content,
                isAnimate: Binding<Bool>,
                animation:Animation,
                duration:Double
    ){
        self.content = content()
        self.destination = destination
        self.animation = animation
        self.duration = duration
        self._isAnimate = isAnimate
        
    }

    
    public var body: some View {
        content.onTapGesture{
            withAnimation(animation){
                self.isAnimate.toggle()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                self.isAnimate.toggle()
                viewModel.push(destination)
            }
        }
    }
}




public struct NavigationPopButton<Content>: View where Content:View {
    @EnvironmentObject var  viewModel:NavigationStackViewModel
    public let content:Content
    public let destination:PopDestination
    
    public init(destination:PopDestination,
        @ViewBuilder content:@escaping () -> Content){
        self.content = content()
        self.destination = destination
    }
    
    public var body: some View {
        content.onTapGesture{
            viewModel.pop(to: destination)
        }
    }
}


final public class  NavigationStackViewModel:ObservableObject{
    @Published fileprivate var current:Screen?
    private var screenStack: ScreenStack = .init(){
        didSet{
            current = screenStack.top()
        }
    }
    
    public func push<S:View>(_ screen:S) {
        withAnimation(.easeInOut(duration: 0.5)) {
            
     
            let screen:Screen  = .init(id: UUID().uuidString, nextScreen: AnyView(screen))
        screenStack.puch(screen)
 
        }
        
    }
    
    public func pop(to:PopDestination)  {
        withAnimation(.easeInOut(duration: 0.5)) {
            switch to {
            case .previous:
                screenStack.popToPrevious()
            case .root:
                screenStack.popToRoot()
            }
        }
    }
}

public enum PopDestination{
    case previous,root
}


 struct Screen:Identifiable,Equatable{
    let id:String
    let nextScreen:AnyView
    
    public static func == (lhs:Screen, rhs: Screen) -> Bool{
        lhs.id == rhs.id
    }
}



 struct ScreenStack{
    private var screens:[Screen] = .init()
    
    
    func top() -> Screen? {
        screens.last
    }
    mutating func puch(_ s:Screen){
        screens.append(s)
    }
    
    mutating func popToPrevious(){
        _ = screens.popLast()
    }
    
    mutating func popToRoot(){
        screens.removeAll()
    }
}
