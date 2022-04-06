//
//  QuizA.swift
//  Fantasy World Quiz
//
//  Created by Daniel Ziems on 7/19/20.
//  Copyright © 2020 Daniel Ziems. All rights reserved.
//

import Foundation

struct QuizA {
    var order : [Int]
    var answers : [Int]
    var currentPage : Int
    var numAnswered : Int
    let unanswered = -1
    let qs = [
        Question(t: 6,
                 q:  """
        You find yourself most naturally:

        a. able, or eager, to recognize patterns, optimize for efficiencies, and quickly troubleshoot in life.

        b. inclined to ponder difficult life questions. My own existence fascinates and challenges me.

        c. observant of beauty. I think my lens on life can be meaningfully unique or even at times amusing.

        d. A and B equally.

        e. B and C equally.

        f. C and A equally.
        """,
                 s:[
                    ["int_a" : 5],
                    ["int_w" : 5],
                    ["int_c" : 5, "int_a" : 2, "soc_e" : 2],
                    ["int_a" : 3.75, "int_w" : 3.75],
                    ["int_w" : 3.75, "int_c" : 3.75, "int_a" : 2.25],
                    ["int_a" : 5.25, "int_c" : 3.75]
        ]),
        Question(t: 3,
                 q: """
        You're dealing with a hard time and need an emotional outlet. Which of the following coping mechanisms has the biggest impact on your recovery?

        a. A creative output.

        b. Discussion with someone I trust will understand.

        c. Time alone to process.
        """,
                 s:[
                    ["int_c" : 5, "soc_e" : 3],
                    ["soc_e" : 1, "int_w" : 1, "int_a" : 1, "spi_e" : 2, "soc_c" : 3, "spi_r" : 1],
                    ["int_a" : 3, "int_w" : 2, "spi_r" : 4],
                    
        ]),
        Question(t: 6,
                 q: """
        You find yourself most stimulated by a:

        a. philosophical discussion.

        b. math or logic puzzle.

        c. work of art.

        d. A or B equally.

        e. B or C equally.

        f. C or A equally.
        """,
                 s:[
                    ["int_w" : 5],
                    ["int_a" : 5],
                    ["int_c" : 5],
                    ["int_w" : 3.75, "int_a" : 3.75],
                    ["int_a" : 3.75, "int_c" : 3.75],
                    ["int_c" : 3.75, "int_w" : 3.75]
        ]),
        Question(t: 3,
                 q: """
        Out of the following life goals, you hope most to have:

        a. Ultimately followed the most morally guided path.

        b. Contributed as much knowledge as possible through my words and work.

        c. Felt spiritually connected with my people and surroundings.
        """,
                 s:[
                    ["int_w" : 3, "int_a" : 2, "soc_c" : 1, "spi_e" : 1],
                    ["int_a" : 3, "spi_d" : 3, "int_c" : 1, "soc_e" : 3, "soc_c" : 1],
                    ["spi_e" : 6, "soc_e" : 2, "soc_f" : 2, "int_c" : 2]
        ]),
        Question(t: 3,
                 q: """
        You find yourself in a verbal disagreement with someone from a neighboring town, and things seem to be getting heated. How do you approach a resolution?

        a. Acknowledge what this person has to say, but stand my ground. Some battles cannot be avoided to maintain the life I have earned.

        b. Remain compassionate. Do my best to understand the person's troubles in the hopes it will be reciprocated and we may resolve the issue most sincerely.

        c. Since the argument has turned aggressive, I will pretend to listen to avoid unnecessary harm, under the awareness that some people are just naturally unreasonable. I don't have to be affected.
        """,
                 s:[
                    ["spi_d" : 3, "spi_r" : 3, "soc_e" : 2, "int_a" : 1],
                    ["spi_e" : 3, "soc_c" : 2, "soc_f" : 1],
                    ["spi_d" : 2, "spi_r" : 5, "soc_e" : 1, "int_a" : 3, "int_c" : 1]
        ]),
        Question(t: 3,
                 q:"""
        You encounter a baby gnorflorf drowning in a puddle with no signs of a guardian around. How do you handle the situation?

         a. I will seize the opportunity for a new accomplice, raising it to be a loyal and strong companion!

         b. I'll move it out of the puddle to give it a fighting chance, but leave it at that. I have other things to tend to, and really nature should be the governing force.

         c. It's a helpless gnorflorf! It would not be my place to take it, but I can’t stand to see the poor thing suffer. I'll find it food and warmth, and if time permits, investigate further for its parents.
        """,
                 s:[
                    ["spi_d" : 4, "soc_c" : 3, "int_c" : 2, "soc_f" : 3],
                    ["int_a" : 3, "spi_d" : 3, "int_w" : 1, "spi_r" : 5],
                    ["spi_e" : 4, "soc_f" : 4, "int_w" : 1, "spi_d" : 2]
        ]),
        
        Question(t: 6,
                 q: """
        Often when working on a project, you are most focused on:

        a. how much others will appreciate my creation.

        b. how much I will learn through the creation process.

        c. the particular message my creation will send.

        d. A and B equally.

        e. B and C equally.

        f. C and A equally.
        """,
                 s:[
                    ["soc_e" : 3, "soc_c" : 3, "spi_e" : 2, "int_w" : 2],
                    ["int_a" : 2, "int_w" : 5, "spi_r" : 2, "spi_d" : 1],
                    ["soc_e" : 6, "int_c" : 3, "spi_r" : 2],
                    ["soc_e" : 2.25, "soc_c" : 2.25, "spi_e" : 1.5, "int_w" : 5.25, "int_a" : 1.5, "spi_d" : 0.75, "spi_r" : 1.5],
                    ["int_a" : 1.5, "int_w" : 3.75, "spi_r" : 3, "spi_d" : 0.75, "soc_e" : 4.5, "int_c" : 2.25],
                    ["soc_e" : 6.75, "soc_c" : 2.25, "spi_e" : 1.5, "int_w" : 1.5, "int_c" : 2.25, "spi_r" : 1.5],
        ]),
        Question(t: 6,
                 q: """
        If you find yourself in a physical fight with someone you’ve hated since childhood, how would you prefer to dominate them?

        a. My undeniable strength: I want to knock them down with a single blow and laugh.

        b. My flawless technique: I want to bob and weave; strike precisely where they don’t see it coming and see them swing at air. I want to make them feel useless.

        c. My unrelenting attack: I want to completely outpace and exhaust them, discouraging them completely with my overwhelming speed.

        d. A combination of A and B.

        e. A combination of B and C.

        f. A combination of C and A.
        """,
                 s:[
                    ["ath_b" : 5, "ath_c" : 2, "spi_r" : 2, "spi_d" : 1],
                    ["ath_c" : 5, "ath_s" : 2, "spi_d" : 3],
                    ["ath_s" : 5, "ath_b" : 2, "spi_r" : 3],
                    ["ath_b" : 3.75, "ath_c" : 5.25, "ath_s" : 1.5, "spi_r" : 1.5, "spi_d" : 3],
                    ["ath_c" : 3.75, "ath_s" : 5.25, "ath_b" : 1.5, "spi_d" : 2.25, "spi_r" : 2.25],
                    ["ath_s" : 3.75, "ath_b" : 5.25, "ath_c" : 1.5, "spi_r" : 3.75, "spi_d" : 0.75]
        ]),
        Question(t: 3,
                 q: """
        You have the opportunity to represent your community in a prestigious athletic event. Based on your natural talents, which event would you be known for winning?

        a. Toop'D'Roop. Lifting of the world's most famous ultra-dense boulder. It's simple really: if you lift the most, you are the fittest. Enormous physique will win the most recognition.

        b. Bloop’D’Noop. You must tie two rodents of standardized size around your ankles, and keep them alive whilst attempting to stomp those of your opponents. Relatively new and still growing in popularity, but nonetheless among the most technically demanding sports.

        c. Joop’D’Gloop. Easily the most daring sport: you must race for time along the lava-moat of a nearly 4-mile volcanic obstacle course. Pushing opponents is permitted and encouraged; swiftness and determination are absolutely necessary.
        """,
                 s:[
                    ["ath_b" : 6, "ath_c" : 2, "ath_s" : 1],
                    ["ath_c" : 5, "ath_s" : 3, "ath_b" : 1],
                    ["ath_s" : 5, "ath_c" : 2, "ath_b" : 2]
        ]),
        Question(t: 6,
                 q: """
        When talking to others, what matters most to you?

        a. The accuracy and effectiveness of my words. My ideas are valuable and I hope to represent them properly.

        b. Earned respect. For any hope of progress in a conversation, people should be able to know me from my actions and trust me.

        c. Mutual honesty and humility. Everyone should feel worthy to speak; the purpose of communication is to share.

        d. A combination of A and B.

        e. A combination of B and C.

        f. A combination of C and A.
        """,
                 s:[
                    ["int_a" : 4, "int_w" : 1, "soc_e" : 3, "spi_d" : 3],
                    ["int_w" : 2, "soc_c" : 1, "soc_f" : 1, "spi_r" : 3, "spi_e" : 3],
                    ["soc_f" : 5, "spi_e" : 4, "soc_c" : 4, "int_w" : 1],
                    ["int_a" : 3, "int_w" : 2.25, "soc_e" : 2.25, "spi_d" : 2.25, "soc_c" : 0.75, "soc_f" : 0.75, "spi_r" : 2.25, "spi_e" : 2.25],
                    ["int_w" : 2.25, "soc_c" : 3.75, "soc_f" : 4, "spi_r" : 2.25, "spi_e" : 5.25],
                    ["int_a" : 3, "int_w" : 1.5, "soc_e" : 2.25, "spi_d" : 2.25, "soc_f" : 3.75, "spi_e" : 3, "soc_c" : 3]
        ]),
        Question(t: 3,
                 q: """
        A war is seemingly imminent, and as a desperate preventative effort, you are chosen as your community's diplomatic representative. In a meeting, your adversaries have so far stubbornly refused anything you have to say. What approach will work best?

        a. I was chosen because I work hard to embody stoicism and dignity. I stand tall, and as is my duty, prove the strength of my people. My composure eventually breaks down their walls, and we discuss terms earnestly.

        b. I was chosen because I believe in the prosperity of everyone and can speak on it genuinely. My meticulous choice of words delicately reduces hostility until we come to respect our differences.

        c. I was chosen because I can easily read a room's energy, and so convince the enemy of my capacity to empathize. In the end, I hope not just to prevent violence, but to establish an ally. I compromise, but form a strong bond.
        """,
                 s:[
                    ["spi_r" : 7, "spi_d" : 3, "soc_e" : 2],
                    ["int_w" : 5, "int_a" : 2, "soc_e" : 4, "spi_d" : 3, "spi_r" : 1],
                    ["spi_e" : 5, "int_w" : 1.5, "int_c" : 2, "soc_f" : 3, "soc_c" : 3]
        ]),
        Question(t: 6,
                 q:  """
        Your relationships are formed primarily by:

        a. my appreciation of wit and my thoughtful explanations.

        b. my outgoing sociability and inclusiveness.

        c. my ability to listen and speak truly to myself.

        d. a combination of A and B.

        e. a combination of B and C.

        f. a combination of C and A.
        """,
                 s:[
                    ["int_a" : 5, "int_c" : 4, "soc_e" : 2, "spi_d" : 2],
                    ["soc_f" : 8, "spi_e" : 2, "soc_c" : 2, "spi_r" : 2],
                    ["spi_e" : 5, "soc_e" : 3, "int_c" : 2, "soc_f" : 2, "int_w" : 3],
                    ["int_a" : 3.25, "int_c" : 3, "soc_e" : 1.5, "spi_d" : 1.5, "soc_f" : 6, "spi_e" : 1.5, "soc_c" : 1.5, "spi_r" : 1.5],
                    ["soc_f" : 7.5, "spi_e" : 5.25, "soc_c" : 1.5, "spi_r" : 1.5, "soc_e" : 2.25, "int_c" : 1.5, "int_w" : 2.25],
                    ["int_a" : 3.75, "int_c" : 4, "soc_e" : 3.75, "spi_d" : 1.5, "spi_e" : 3.75, "soc_f" : 1.5, "int_w" : 2.25]
        ]),
        Question(t: 3,
                 q: """
        On your travels to a town, you reach a three-way forking road. Each path separately leads to your desired town, but has different challenging obstacles. Knowing your strengths and shortcomings, on which path are you most likely to make it?

        a. The jungle path, 5 miles. A reasonable distance, but I'll have to be resourceful. I'll enjoy clearing my own new way through the dense, thorned foliage and forceful quicksand.

        b. The quiet winding maze, 2 miles. Though it's shortest, it's the hardest to navigate. But, a quieter setting means clearer thoughts. My memorization and instincts will work through the perplexing stone and hedge walls.

        c. The narrow cliffside path, 7 miles. The longest path, but also the clearest. Though vigorous winds sweep through, I can count on my superior balance, foresight, and wisdom to keep me from slipping or overexerting.
        """,
                 s:[
                    ["ath_b" : 3, "ath_c" : 1, "ath_s" : 4, "int_c" : 5, "int_a" : 2, "spi_r" : 2, "spi_d" : 2],
                    ["ath_c" : 1, "int_a" : 6, "int_w": 2, "spi_r" : 2, "spi_d" : 5],
                    ["ath_c" : 4, "ath_b" : 2, "ath_s" : 1, "int_w" : 6, "int_a" : 1, "spi_r" : 3, "spi_d" : 1]
        ]),
        Question(t: 3,
                 q: """
        You are making a secret hideout. It is concealed in plain sight, awaiting the correct sequence of claps, a twist of the correct book on the shelf, or a pressure plate below the rug. What is its most valuable use?

        a. A meeting place for my closest compatriots. A gently-lit and comfortable lounge away from civilization where talk can be unrestricted and socratic or just relaxed.

        b. Quiet seclusion. Nobody else will know about my base; I will keep it simply so I have a secure, peaceful place to sort out my thoughts.

        c. The coolest nightclub. The place people whisper about having been to, but nobody names in broad daylight. Classy in design and well-kept, all for the surreal thrill of being the single provider of such enjoyment for people.
        """,
                 s:[
                    ["int_w" : 3, "soc_c" : 3, "soc_f" : 2, "soc_e" : 1, "spi_e" : 2],
                    ["int_a" : 3, "int_w" : 3, "spi_r" : 4, "spi_e" : 3],
                    ["int_c" : 5, "soc_f" : 4, "spi_d" : 2, "soc_e" : 5]
        ]),
        Question(t: 3,
                 q: """
        You get the choice of one creature companion to accompany you on your journey. Which of the following do you choose?

        a. Shnorb. A feather-winged creature. Shnorbs are popular for their ironic combination of wide-eyed adorableness and yet remarkable prudence. Shnorbs are rumored to have some telekinesis, though this has never been documented. Great listeners for those with a lot on their mind.

        b. Q’NOCK’FLOCK: It is Q’NOCK’FLOCK. ROCK FRIEND who help get job DONE.

        c. Worble: A fox-like pup, selectively bred to seasonally produce usable mittens on its paws. They are consistently proud, good boys, who are extra stealthy from the mittens if necessary. As a good boy, he will learn most of the tricks you teach him, will stay by your side at all costs, and will often reduce aggression in opponents who will want to pet him. Adaptable explorers.
        """,
                 s:[
                    ["int_w" : 4, "spi_e" : 3, "soc_e" : 4, "int_a": 2],
                    ["spi_d" : 4, "int_a" : 2, "spi_r" : 4, "soc_c" : 2, "soc_f" : 2],
                    ["soc_f" : 6, "int_c" : 2, "int_a" : 1, "spi_r" : 3, "spi_e" : 3, "soc_c" : 3]
        ]),
        Question(t: 3,
                 q: """
        You have a number of deadlines looming--no time to procrastinate--and stress is beginning to rise. Assuming you will get started from here forward, how are you most likely to approach your tasks?

        a. Spend some time thinking about what to do, and write a detailed schedule of execution.

        b. Spend a little time thinking about what to do, but save my energy for the tasks themselves, leaving intuition to schedule my time well enough.

        c. Get started immediately. The more time I spend anxious thinking about all I have to do, the worse off I will be. I won’t waste a second.

        """,
                 s:[
                    ["int_a" : 3, "spi_d" : 3],
                    ["int_a" : 2, "int_w" : 2, "spi_d" : 1.5, "spi_r" : 1.5],
                    ["int_c" : 3, "int_w" : 1, "spi_r" : 2, "spi_e" : 1]
        ]),
        Question(t: 6,
                 q: """
        With which of the following abilities are you most naturally gifted?

        a. To read a person by the subtleties of their body language and countenance.

        b. To make the right decision quickly, or an excellent performance without rehearsal, by intuition.

        c. To push myself until collapse when it matters.

        d. A and B equally.

        e. B and C equally.

        f. C and A equally.
        """,
                 s:[
                    ["int_a" : 2, "spi_e" : 5],
                    ["int_w" : 2, "spi_d" : 5],
                    ["int_c" : 3, "spi_r" : 7],
                    ["int_a" : 1.5, "spi_e" : 3.75, "int_w" : 1.6, "spi_d" : 3.75],
                    ["int_w" : 1.5, "spi_d" : 3.75, "int_c" : 2.25, "spi_r" : 5.25],
                    ["int_a" : 1.5, "spi_e" : 3.75, "int_c" : 2.25, "spi_r" : 5.25],
        ]),
        Question(t: 3,
                 q: """
        How would you say you are most physically talented?

        a. Coordination, dexterity, reflexes.

        b. Strength, stability, power.

        c. Swiftness, fluidity, hustle.
        """,
                 s:[
                    ["ath_c" : 4],
                    ["ath_b" : 4],
                    ["ath_s" : 4]
        ]),
        
        Question(t: 3,
                 q: """
        It's a casual Throkn'flok-Day--the fourth day of twelve to a week--and you are sitting in your abode with nothing to do. The air is oppressive and your head is fuzzy with boredom. To prevent your brain from vaporizing, which activity do you feel instinctively inclined to do?

        a. I must make something. Draw a sketch, cook a meal, play a catchy melody--anything; elaborate or simple, it doesn't matter. My mind and hands get to move, and the opportunity to enjoy or be proud of what I create is most satisfying.

        b. I will walk or run--nowhere in particular--to change the pace. A simple remedy, but that's why it's so outstanding. Placing myself physically in a new setting can just as much shift my mental whereabouts.

        c. I will see if any friends are available. This would multiply the number of minds working on what to do, and in the end doing an activity with others makes the activity more rewarding.
        """,
                 s: [
                    ["int_c" : 8, "spi_r" : 4, "spi_d" : 3],
                    ["int_w" : 6, "int_a" : 2, "spi_e": 3, "spi_d" : 3],
                    ["soc_f" : 3, "soc_c" : 6, "spi_e": 1]
        ]),
        Question(t: 6,
                 q: """
        Your beverage of choice? First one is on the house--oh, and if you would, maybe refrain from notifying the authorities about our little establishment.

        MENU:

        Hingl'flig'n -
        Fligs your cortex with hingls, which are a concentrated, mostly harmless substance known to *really* unlock your thinker. What's fligging? Find out today.
            (Optional) shnog's cream, fooproot sweetener.

        a. One hingl'flig'n. I've got plans.

        Fifflewhiffle -
        A fizzed, refreshing yorgfruit concoction that was originally a science experiment. Time around you slows, or are you speeding up? Makes for a fascinating perspective shift on reality, but mind your urge to belch; it will teleport you short, semi-controllable distances.
            (Optional) no fizz, bonus fizz.

        b. I've come for a fifflewhiffle!

        Yarbnarb -
        Rare, earthy, rooty, no-fun health shot. Wince through the initial punch, and the yarbnarb will make everything clear--for body and mind.
            (Optional) clompgrass foam, snurfleaf powder.

        c. A yarbnarb is just what I need.

        Swoffletop - Condensed from a cloud which holds a pleasant, sweet touch by having fused with the Swofular air particulates of the Swongle Swamps. It's a trip.
            (Optional) extra swoffle, extra top.

        d. A swoffletop and a safe journey, please.

        Punqas -
        A make-your-own smoothie. Riveting! Along with any fruit you like goes dilute florfnerb serum, which lets you temporarily scale your physical size from ten times bigger to ten times smaller. Useful for any number of tasks, just don't ask for the science behind it.
            (Optional) your choice of fruit, whipped shnog's cream.

        e. I'd like to make my own punqas, for my own punk behind.

        Juice -
        A warm, flaky, savory pastry baked to a brilliant crisp. It is exceptionally difficult to ingest juice as a beverage, and what happens if you do is a mystery.
            (Optional) fried groop egg, sprinkle of salted shnog cheese.

        f. I'm starving; some juice would hit the spot.
        """,
                 s: [
                    ["int_a" : 6, "int_c" : 4, "spi_d" : 3],
                    ["int_w" : 4, "int_a" : 4, "spi_r" : 3],
                    ["int_w" : 6, "spi_r" : 2, "spi_e" : 2],
                    ["int_c" : 4, "int_w" : 4, "spi_r" : 2, "soc_f" : 2, "soc_e" : 2],
                    ["int_c" : 3, "spi_r" : 3, "soc_e" : 5],
                    ["mystery" : -1]
                    
        ])
    ]
    
    init() {
        print("Initializing quiz")
        currentPage = 0
        numAnswered = 0
        order = [Int](repeating: 0, count: qs.count)
        answers = [Int](repeating: unanswered, count: qs.count)
        scrambleOrder()
    }
    
    mutating func scrambleOrder(){
        var source : [Int] = []
        let size = order.count
        for i in 0..<size {
            source.append(i)
        }
        var ind = 0
        var remaining = size
        while remaining > 0 {
            let nextInd = Int.random(in: 0..<remaining)
            order[ind] = source[nextInd]
            remaining -= 1
            for i in nextInd..<remaining {
                source[i] = source[i + 1]
            }
            ind += 1
        }
    }
    
    func getQ() -> String {
        return qs[order[currentPage]].query
    }
    
    mutating func setPage(pageNum : Int) {
        if pageNum <= (qs.count - 1) {
            currentPage = pageNum
        }
    }
    
    mutating func generateRandomAnswers() {
        for i in 0..<qs.count {
            answers[i] = Int.random(in: 0..<qs[i].type)
        }
        numAnswered = qs.count
    }
    
    func printAnswers() {
        if numAnswered == qs.count {
            print("Quiz answers:")
            for i in 0..<qs.count {
                print("Question ID \(order[i]): \(answers[order[i]])")
            }
        }
        else {
            print("Warning: printAnswers() called before all questions answered!")
        }
    }
}
