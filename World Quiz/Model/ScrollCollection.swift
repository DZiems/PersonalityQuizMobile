//
//  ScrollCollection.swift
//  World Quiz
//
//  Created by Daniel Ziems on 7/26/20.
//  Copyright © 2020 Daniel Ziems. All rights reserved.
//

import Foundation

struct ScrollCollection {
    let scrolls : [String : InfoScroll] = [
        "World and Species" : InfoScroll(pTs: [
            """
Chapter 1:
The Droob'n'st People

Quadrupedal, Chitin-Armored, Cerebral People of the Droob'n Oasis
""",
            """
Chapter 2:
The Skloon'st People

Bipedal, Mole-Humanoid, Inventive People of the Skloon Forest Undergrounds
""",
            """
Chapter 3:
The Garoof'ibn'st People

Shapeshifting Florfnerb-Symbiote Telepaths of the Hidden Garoof'ibn Isles
""",
            """
Chapter 4:
The H'glur'boon'st People

Bipedal, Celestial, Gentle Giants of the Central H'glur'boon Mountains
""",
            """
Chapter 5:
The Eastern and Western Fn'r'noot'st People

Seal-Variant, Clever, Cute, Acid-Spraying People of the Fn'r'noot Spikelands
""",
            ],
                                         pgs: [
                                            """
Chapter 1: The Droob'n'st People

History states these people settled by unbelievable circumstances. Originally a small group of western travelers searching for the electrically imbued Droob’n’st stones, they underestimated the immense dunes, scarce resources, and erratic temperatures that constitute the Droob’n deserts. But, after nearly exhausting all resources, losing over half their squad, and struggling to live off only a small pool of water for 27 days, things changed.

Between this time, their deeply meditative second-in-command Birbir’Garb had reportedly escaped into what she called a physically traversable, external metaphysical realm. On that 27th day she returned, calling herself "exposed" and declaring that, "The universe's contradictions are its very essence, and they alone can characterize the subtle purpose for life."

After her revelation, an earthquake reportedly raged, tearing open their small pool of water to reveal an expansive lake. The people increasingly flourished off the new water while harnessing Droob’n’st stones and enjoying Birbir’Garb’s teachings. Quickly, they emerged as powerfully ordered, philosophically and logically driven people, prioritizing knowledge alone to guide their search for fulfillment and enrichment.

Droob'n'st civilization is home to the highly protected Drofe'n'Funf: a collection of prodigious knowledge--too overwhelming for most--all compiled into a single book. The book is recognized as one of life's most sacred creations, and the universe itself seems to affirm this by the constant, warm glow with which the book has mystically resonated since publication.

Though the Droob'n'st people have come so far, Birbir’Garb is now tragically babbling nonsense of old age on her deathbed. Meanwhile, hundreds of disciples, each with their own interpretations of her word, are eager to substantiate and establish their own ideas, leaving the future unclear as the push for an ultimate truth grows ever stronger...
""",
                """
Chapter 2: The Skloon'st People

The origin of these folk is unknown due to their vastly underexposed, and thus understudied, way of life and history. Of the few scholars who have witnessed the cryptic Skloon'st people, most suppose they established their current settlement in response to the so-called Püt Wave--a toxic storm which historically spread over a quarter of the planet--by digging their way into the Skloon Forest's muddy underground.

Instead of reemerging after the so-called Dissipation was observed to have remedied most of the land, the Skloon’st civilization by then had determined they preferred their new home. To reinforce impressions of their already undeniable adaptability, the Skloon'st people have a peculiar, flexible sleep cycle: they are nocturnal/diurnal hybrids, and may sleep up to three times across a single day. More, the claws they had once used for self-defense are now a means for designing massive underground civilizations. Though threatening predators on the surface had once led Skloon’st to live humble lives, now ever-advancing hydroponic agriculture supports their entire diet.

Perhaps this combination of an odd sleep cycle and an underground habitation, far-removed from any chaos, helps explain their strong reclusive habits, even among their own kind. Still, Skloon'st people's affinity for both beauty and functionality in their creations work to uphold a strong sense of culture. Perhaps the most famous of their creations, to the few who have documented New Sklink'n'Skloon City, is the awe-inspiring engineering marvel, Shoob-Skloon: a collaborative mechanical endeavor whose purpose is to illuminate the entire central square with aesthetically dramatic, autonomously daytime-adjusted lights.

Justifiably, the most ambitious among the Skloon’st people are left with great dreams of employing their collective strengths--in adaptability, creativity, inventiveness--to expand further than ever before conceived...
""",
                """
Chapter 3: The Garoof'ibn'st People

The Garoof’ibn’st people have lived mysterious, spiritually-driven lives. Due to a permanently raised tide, initial settlers became trapped on what was once a single mountainous peninsula. This isolation, on what has now turned into a large collection of islands dotting the Garoof’Loof’Poof’Noof Sea (not to be confused with its less interesting southern counterpart, the Garoof’Loof’Noof’Boof Sea), unexpectedly became an extraordinary advantage.

Astoundingly, by adopting a gentle symbiosis with the native Florfnerb--a peculiar, flowy, magical, *deadly* regional plant--these people reaped psychic ability. Having always been highly empathetic creatures, the Garoof’ibn’st people began to develop an entirely telepathic medium for communication. As if that weren't enough, by adapting their bodies to host the Florfnerb, they became partially amorphous in physical structure, meaning their bodies began to shapeshift with whatever degree of strength their spirit granted them.

Free-formed in both mind and body, Garoof'ibn'st people are universally known as the strongest communicators and expressers. On special nights, the Garoof'ibn'st people pleasantly resonate their songs, transmitting from their collective mind directly to any distant, willing listeners. They have managed to successfully communicate with many cognizant lifeforms, however foreign, but may sometimes generate uneasiness by their penetrating perception of another's feelings.

Understandably, some Garoof'ibn'st people have taken to worshiping the Florfnerb as some kind of divine body. The ultimate power in the mind of a Garoof'ibn'st person--one seen only among the truly exceptional--is the power of telekinesis. Even the most willful of the Garoof’ibn’st people have to practice at great lengths and take special Florfnerb nourishment measures to utilize such force.

Many, however, remain convinced that with just the right alignment of properties, their psychic abilities will yield some yet undiscovered form of ascension...
""",
                """
Chapter 4: The H'glur'boon'st People

Rumored to have extraterrestrial origins, these people supposedly crash-landed onto the planet (or otherwise, they must have long since lost the mode of advanced travel that brought them here). Seemingly living bio-meteorites, H'glur'boon'st people average 9 feet tall, are born magnetic, and perhaps most interestingly, can control drastic degrees of heat by chemically churning the bio-metallic regions of their bodies and then transferring it into focused regions, namely their hands, feet, head, and abdomen. Such a display has many applications: the practical, such as for their notoriously exquisite craftmanship, or the cultural, as in dance performances.

From their innate magnetism and their finely tuned nervous systems, H'glur'boon'st people are especially sensitive to the planet’s electromagnetic field. In fact, most believe the planet they inhabit to be living, and often form a type of spiritual bond to it. They are admired by many for using their unique understanding of the planet to aid any concerned life around them.

Perhaps because of their celestial origins, these people feel especially fulfilled by doing what they believe are universally good deeds. Renowned for their wholesome campfires, for which invitations are generously distributed, the H’glur’boon’st people have a culture that exemplifies benevolence and selflessness. Marvelously, even with those soft hearts, these people are sturdy in every interpretation possible; able to weather almost any adversity with secure minds and hearts. Anyone lucky enough to witness their most excited heat-generated state, whether from a threat or simply their own deep emotions, know a brilliant star-like figure of inexplicable awe.

Corresponding with the H’glur’boon’st people leaves a funny sense of irony: the people whose origin lies from beyond the planet appear most considerate toward maintaining its collective livelihood. One might call them "down to Earth ;)." Of course, as time inevitably calls for change, friends can only pray these kind folk are never taken advantage of...
""",
                """
Chapter 5: The Eastern and Western Fn'r'noot'st People

Once a calmer, easily inhabitable plateau, the Fn’r’noot landscape dramatically eroded into a deadly expanse of limestone spikes by the intense heavy rains on the farthest edges of the Püt Wave. Based on appearance alone, settlement among knifelike spikes might seem unpromising for the Fn’r’noot’st people--maybe downright foolish. Alas, their response to the Püt catastrophe precisely demonstrated their charm: ingenious strategization, diligence, and cunning. The Fn'r'noot'st people foresaw the drastic changes to the landscape, and acknowledged that the great change would expose an opening in the structure of the entire ecosystem.

Under a shared objective, the Fn'r'noot'st people got planning, and with every detail entertained, took to organizing a conquest. Their scheming--of labor and territory distribution, shelter building, and resource gathering, all while making time to enjoy the essential contemplative spot of tea--discretely elevated them as top predators. Well, that, and of course their orally projected acid spray, which had always been a handy technique a Fn'r'noot'st person could use to melt the face off an unsuspecting prey.

The Fn'r'noot'st people have since flourished in the spikelands, taking pride in the irony that they are top predator seal-people. On one hand, these people are admired for many things: principally their love of sharp wit, constant proactiveness, productiveness, and objective cuteness; yet, they are feared for many others: acid spray being the main one, but also their typical, 'business only' demeanor, which can be difficult to see past.

Not only have these fears caused a fair share of undesired rejection and isolation from outsiders, they have left the Fn’r’noot’st people in an escalating identity crisis. Split nearly down the middle, the Eastern Fn’r’noot civilization holds a, "Fend for ourselves; benefit off the weak and incompetent" attitude, while the Western Fn'r'noot region works toward a more cordial, "share your tea within introspective poetry circles, and attempt stronger relationships" sentiment.

Given the notoriety of the Fn’r’noot’st people as both skilled debaters and fearsome predators, the sway of this disagreement is volatile indeed...
"""
        ]),
        "Quiz Details" : InfoScroll(pTs: [
            "Chapter 1: Your Character",
            "Chapter 2: Quiz Section A",
            "Chapter 3: Quiz Section B",
            "Chapter 4: Calculating Results",
            ],
                                    pgs: [
                                        """
Chapter 1: Your Character

Note: If you would prefer the most unbiased quiz-taking experience, you are strongly advised to read this scroll AFTER you have finished taking the quiz for the first time. You are, however, encouraged to read the World and Culture scroll, and especially any other scrolls you may encounter along your quiz.

*POTENTIAL SPOILER INFORMATION HERE FORWARD (INCLUDING SUBSEQUENT PAGES)*
This quiz aims to determine your personality by aligning you under four broad sets of characteristics. Each set of characteristics is defined by a main attribute which then has a breakdown of three sub-attributes. Though a person may feel an absolute mastery with each of the three sub-attributes in a main attribute, the three must be balanced against each other as ratios. Ultimately if a user cares deeply about being strong in all three categories, this is addressed in the 2nd section of the quiz. However, no character gets it all; each character will have its balanced set of strengths and weaknesses.

Your main and sub-attributes are broken down as follows (If you read the Attributes scroll, pay mind to the percentages of influence and the Physicality breakdown; you have seen everything else):

1. Intellect    (30%) - Governs your ability to use the power of your mind to make discoveries and find solutions. Intellect is as powerful a characteristic as it is straightforward. You can't go wrong being smart.

Types of Intellect -
    a. Creativity - How uniquely you see the world; how inclined you are to create.

    b. Wisdom - How likely you are to make the most fulfilling decisions.

    c. Analytics - How efficiently you think; how skillfully you can recognize patterns; your general critical thinking capabilities.

2. Spirit       (30%) - Governs your connectedness with your environment, as well as your general will to accomplish. Spirit may be many things in one word, but any of those with a strong spirit have remarkable power.

Types of Spirit -
    a. Empathy - How well you can read another person; how well you can form meaningful connections and feel integrated; plays a strong role in emotional intelligence.

    b. Resilience - How mentally tough you are; how independently you can work.

    c. Decisiveness - How skillfully you can land on not just any choice, but the right choice; plays a strong role in your self-assuredness.

3. Sociability  (30%) - Governs your influence over others--not necessarily in a domineering sense. As a sociable person, you may be more capable of working in a team, establishing trust, conveying yourself, reaching people with your words, and making connections.

Types of Sociability -
    a. Expressiveness - How accurately and effectively you communicate, whether that means speaking a language, playing an instrument or simply exuding some tone through body language; plays a role in trustworthiness.

    b. Cooperativeness - Both how well you work in a team and how well you can guide a group's work atmosphere, however subtle or charismatic your style may be.

    c. Friendliness - How well you establish strong friendships; how kindly people may default with you; plays a role in trustworthiness.

4. Physicality  (10%) - A less influential aspect of your final race alignment, simply measures the way you conduct yourself in physical situations.

Types of Physicality -
    a. Swiftness - Your speed; your hustle; your fluidity; your drive!

    b. Coordination - Your reflexes; your technique; your precision!

    c. Strength - how HUGE YOU ARE!
""",
                                        """
Chapter 2: Quiz Section A

This section will ask you a series of questions, each of which will add a certain number of points to your sub-attributes (SAs). By the end of the quiz, you will have added up a lot of points into each SA. Ratios must be calculated between all four groups of three SAs at this point. Respective to their group, a total point count is added, and then each sub-attribute is divided by their total to generate a user's SA ratios. This sequence is relatively straightforward, though the point balance for each question is surpisingly complex. Some questions answers may add points to 7 different attributes at a time. If you choose an answer that's a combination of two other answers, you get 75% of the points from both of those single answers. Note that this does NOT mean you are making a stronger character with more total points, because your points are turned into ratios at the end of this section anyway.

The purpose of the ratios is covered in the Calculating Results Chapter.

Side note: The metrics for balancing quiz questions relies on the creator's intuition, but can be influenced by biases or limited by life/social experience and awareness. That said, testing on many people and making the appropriate adjustments leads to a fairly accurate assessment!
""",
                                        """
Chapter 3: Quiz Section B:

This section asks you to judge your own aptitude with respect to the three important main attributes (out of four): intellect, spirit, and sociability. Physicality, the fourth main attribute, is not judged as a major factor of your personality, relatively speaking (only 10%). You have 100 total points, but each stat has a minimum of 15; so, you are asked to spend the remaining 55. Once this is completed, you have everything you need to determine to which species you best align. At this point, your sub-attribute values can be finalized simply by multiplying each ratio value by the points you set for your main attributes. For example, you might have .20 creativity and 50 intellect, leading to 10 creativity as your final stat.
""",
                                        """
Chapter 4: Calculating Results

This chapter complicates the data a bit. A user's alignment with other species can be determined in many ways. To help explain, an example user's intellect stats will be provided:

User -
Intellect: 25
    Creativity: (0.10) * 25 = 2.5
    Wisdom: (0.48) * 25 = 12
    Analytics: (0.42) * 25 = 10.5

Now, lets compare this user's stats with two species. The first will be a made up species for the purpose of this example, but the second will be the Droob'n'st, a race you can actually align with.

Made up species -
Intellect: 25
    Creativity: (0.15) * 25 = 3.75
    Wisdom: (0.35) * 25 = 8.75
    Analytics: (0.50) * 25 = 12.5

Droob'n'st -
Intellect: 50
    Creativity: (0.10) * 50 = 5
    Wisdom: (0.48) * 50 = 24
    Analytics: (0.42) * 25 = 21

Based on the sub-attributes' points alone, our user far more closeley resembles the made up species. But, based on the ratios between each attribute alone, the user's intellect is identical to that of a Droob'n'st. This quiz relates likenesses in both categories by a split 50/50. If points are within a certain arithmetic range, you get aligned half the points. If points are within a certain percentage range, you get aligned the other half.

For arithmetic calculations, 4 tiers of ranges determine the first half of points you will get, where each tier after the first is twice the size of the last. Ranges will differ depending on how many points you have to a main attribute. If you have 50 intellect, your tier 1 range is +- 4. If you have 15 intellect, your tier 1 range is +- 2. This means the range changes anywhere between 2 and 4 for each of the main attributes (exclusing Athletics). Ranges will grow linearly from 15 to 50.

For percentage calculations, another 4 tiers of ranges determine your next half of points. This one is more simple: the first tier is a constant +- 7.5%, and each following range is twice this range's magnitude.

For both arithmetic and percentage, landing within the first tier grants you 100% points of similarity, landing within the tier 2 range (twice tier 1's range) offers 50% points, tier 3 offers 25%, and tier 4 offers 12.5%.
    
Your likenesses to other races are ultimately valued out of 10. 3 * 3 points can come from Intellect, Spirit, and Sociability, and the final point can come from Athletics. This means Athletics counts for a third of the influence of any other main attribute.


The end.
Thanks for reading!
"""
            ]
        ),
        "Attributes" : InfoScroll(pTs:
            ["Chapter 1: Intellect",
             "Chapter 2: Spirit",
             "Chapter 3: Sociability",
             "Chapter 4: Adding to a Main Attribute"],
                                  pgs:
            [
                """
Chapter 1: Intellect

Governs your ability to use the power of your mind to make discoveries and find solutions. Intellect is as powerful a characteristic as it is straightforward. You can't go wrong being smart.

Types of Intellect -
    a. Creativity - How uniquely you see the world; how inclined you are to create.

    b. Wisdom - How likely you are to make the most fulfilling decisions.

    c. Analytics - How efficiently you think; how skillfully you can recognize patterns; your general critical thinking capabilities.
""",
                """
Chapter 2: Spirit

Governs your connectedness with your environment, as well as your general will to accomplish. Spirit may be many things in one word, but any of those with a strong spirit have remarkable power.

Types of Spirit -
    a. Empathy - How well you can assess someone's feelings and intentions, whether those are your own or another's; plays a strong role in emotional intelligence.

    b. Resilience - How mentally tough you are; how independently you can work.

    c. Decisiveness - How skillfully you can land on not just any choice, but the right choice; plays a strong role in your self-assuredness.
""",
                """
Chapter 3: Sociability

Governs your influence over others (though not necessarily in a domineering sense). As a sociable person, you may be more capable of working in a team, establishing trust, conveying yourself, reaching people with your words, and making lasting connections.

Types of Sociability -
    a. Expressiveness - How accurately and effectively you communicate, whether that means speaking a language, playing an instrument or simply exuding some tone through body language; plays a role in trustworthiness.

    b. Cooperativeness - Both how well you work in a team and how well you can guide a group's work atmosphere, however subtle your style may be.

    c. Friendliness - How well you establish strong friendships; how kindly people may default with you; plays a role in trustworthiness.
""",
                """
Chapter 4: Adding to a Main Attribute

If you have read the other three chapters, you now understand the three main attributes: Intellect, Spirit, and Sociability. You must add points to these main attributes based on what you see as your aptitudes.

Important: When adding to a main attribute, you are acknowledging that you could be empowering any possible ratio of its sub-attributes. For example, if you raise your intellect, you are recognizing your intellectual aptitude in general, not necessarily how much you weigh into any specific sub-attribute. These sub-attributes are listed for you to have a more complete grasp of otherwise ambiguous terms. Those first paragraphs of each previous chapter should be guiding most of your choices for this section of the quiz.
"""]
        )
        
    ]
    
}
