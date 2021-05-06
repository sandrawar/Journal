//
//  InspirationView.swift
//  Journal


import Foundation
import SwiftUI
import CoreData

struct InspirationView: View {
    
    //https://thoughtcatalog.com/
    
    let understandYourselfInspirations = [
        "Name the three biggest priorities in your life right now.",
        "What are your biggest fears?",
        "What would you do if you were granted three wishes?",
        "Do you have a secret talent you are hiding?",
        "What are you best at, and what do you love doing most, and how could you spend more time doing both?",
        "What makes your heart sing loudest? What makes your heart beat strongest?",
        "What scares you the most, and why? How can you use that fear to improve or learn or grow?",
        "What are three things that you are really looking forward to the most?",
        "What do you love most about yourself?",
        "What would you truly lose, deep down, if you lost what you are most scared of losing?",
        "What did you really love doing as a kid but don’t really do anymore? What is stopping you from doing it now, and what would happen if you did?",
        "What makes you feel happy to be alive, and how can you make more of that every day?",
        "What truth have you been refusing to admit to yourself and how could you face it?",
        "What does your ideal day look like? Be specific.",
        "What one event in your life has changed you the most?",
        "If you could be president for one day, what would you do, and why?",
        "Assuming your life is a story and you are the author, what does your happy ending look like?",
        "What makes you the most angry, the most frustrated, the most annoyed, and why?"
    ]
    
    let yourGrow = ["How have you grown this year?",
        "What are the most important life lessons you have learned?",
    "How do you define success, and how will you know when you have it?",
    "Where do you see yourself in 3 months, 6 months, and 12 months? Be specific.",
    "What have been the five best days of your life, and why?",
    "What would you tell your five-year-old self?",
    "If you could change one thing about yourself, what would it be and what’s stopping you from taking action?",
    "What is the best advice you have ever been given?",
    "What are five things you absolutely, positively, totally want to do before you die, and how can you do one of them THIS YEAR?",
    "What about your life makes you the most proud?",
    "When did you hurt most, and how has it helped you or taught you or improved you?",
    "If you could, what is the one thing you would change about your past?",
    "What three things could you give up that would give you more time, energy, and peace?",
    "What advice would you give yourself five years ago?",
    "If you found out that you were going to die tomorrow, what would be your three biggest regrets?",
    "How can you improve the way you treat yourself and talk to yourself?",
    "When was the last time you cried, and what did it teach you?",
    "What is your personal mantra for this year? What one word best describes your best life moving forward?",
    "What is something you have never done, but always wanted to do, and what is so important about this for you?"]
    
    let findYourBalance = ["If you had a magic wand, and could wave away your problems, what would your life look like? What’s stopping you from being the wand?",
        "If you were unapologetically and truly yourself, day in and day out, and if you fully accepted and loved yourself, what would change for you moving forward?",
        "What do you believe that no longer serves you? What do you believe that might be holding you back?",
    "What are the ten smallest, most minor, most insignificant things in your life that you are grateful for?",
    "How would your life be different if you stopped living so much in the past and/or worrying so much about the future?",
    "How would your life change if you were your own biggest fan and truly believed in yourself?",
    "How do you deal with helplessness, with letting go, with release and surrender of expectations?",
    "What are five things that you love most in the world?",
    "Who do you admire most in this world, and why?",
    "What does it mean to be good enough, and how do you know that you are?",
    "What do you love most about your life?",
    "When are you at your best, and how do you get back there when you feel unbalanced or unwell?",
    "What are the five most important things in your life right now and how are you prioritizing them (or not)?"]
    let relationshipsWithOthers = ["What does love mean to you?", "Who do you need to forgive, and why, and what’s stopping you from doing it today?",
        "Who do you care about most in the world, and what could you do today to make sure they know it?",
    "What does heroic mean to you, and who are your biggest heroes?",
    "If you could invite five people, living or dead, to dinner at your house one night, who would you choose, and what would you cook them?",
    "Think about the most important person in your life. How does he or she make you feel?"]
    var body: some View {
        NavigationView{
            List {
                Section(header: InspirationHeader(symbol: "heart", name: "Understand Yourself")) {
                    ForEach (understandYourselfInspirations, id: \.self) { inspiration in
                        NavigationLink(inspiration, destination: WriteInspiredView(inspiration: inspiration))
                    }
                }
                Section(header: InspirationHeader(symbol: "leaf", name: "Your Grow")) {
                    ForEach (yourGrow, id: \.self) { inspiration in
                        NavigationLink(inspiration, destination: WriteInspiredView(inspiration: inspiration))
                   }
                }
                Section(header: InspirationHeader(symbol: "tornado", name: "Find Tour Balance")) {
                    ForEach (findYourBalance, id: \.self) { inspiration in
                        NavigationLink(inspiration, destination: WriteInspiredView(inspiration: inspiration))
                   }
                }
                Section(header: InspirationHeader(symbol: "person.2", name: "Relationships With Others")) {
                    ForEach (relationshipsWithOthers, id: \.self) { inspiration in
                        NavigationLink(inspiration, destination: WriteInspiredView(inspiration: inspiration))
                    }
                }
            }
            .navigationTitle("Your prompts")
            .listStyle(GroupedListStyle())
            .accessibilityScrollAction { edge in /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Code@*/ /*@END_MENU_TOKEN@*/  }
        }
    }
}

struct InspirationHeader: View {
    let symbol: String
    let name: String
    var body: some View {
        HStack {
            Image(systemName: symbol)
            Text(name)
        }
        .foregroundColor(Color("HeadersColor"))
        .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
    }
}

struct InspirationView_Previews: PreviewProvider {
    static var previews: some View {
        InspirationView()
            .preferredColorScheme(.dark)
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

