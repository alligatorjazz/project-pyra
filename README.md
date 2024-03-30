# Project Pyra

## Overview
Project Pyra is a stealth action game about a lonely pyromancer who must traverse a perilous archipelago to reignite a collection of dormant lighthouses. The game's core loop centers around the way that enemies, the environment, and the player character react to fire and light.

## Gameplay

### The Player
The player inhabits a pyromancer equipped with various spells that produce or manipulate fire. At first, the spells the player have access to are extremely minimal, but they gain strength and potency with each lighthouse the player successfully reignites.
1. **Illumination**: The pyromancer can illuminate an area immediately surrounding them. While this allows the player to see their surroundings, it also reveals their position to nearby enemies. As the ability grows more powerful, the illuminated area gradually increases. At its maximum power, the illumination can be charged to execute a flashbang attack that stuns most enemies.
2. **Fireball**: The pyromancer can shoot a fireball at enemies and puzzle objects. At first, the fireball is puny and only useful for lighting torches and grass, but it gradually grows in power until it can eventually be used against powerful foes. The fireball also possesses illumination properties.
3. **Super Jump**: The pyromancer can use concentrated detonations to propel them across small gaps and up to unreachable places. In each case, a trail of fire is left behind. At first, this can be a liability due to it alerting nearby enemies, but at its maximum power this fire trail becomes a potent source of damage.
4. **Pouch**: The player can carry various substances or objects in their pouch.

### The Enemies
(TODO: Flesh out enemy descriptions.)
1. Cretins: Hyena-esque quadrupedal creatures with grotesque spots and the horns of a jackalope.
   1. They cannot see in the dark, and they have little in the way of hearing.
   2. They automatically aggress the player and any other non-Cretin enemies in (lit) sight.
   3. They are blinded by max-level illumination.
2. Beasts: Giant bear-like creatures with six limbs with vacant eyes.
   1. They do not see in the dark, but they can hear the player clamoring around on loud surfaces or interacting with loud puzzle objects.
   2. They typically do not wander, remaining idle they hear or spot prey.
   3. They are blinded by max-level illumination.
3. Sentry: The first human enemies the player will encounter. Low-level grunts who have been pressed into service by some distant empire.
   1. They have limited sight in the dark, and they can hear the player's footsteps on loud surfaces.
   2. They have set patrol paths that they follow, and they will notify each other of the player's presence if they spot them.
   3. They are blinded by max-level illumination.
4. Commandant: The officer corps of some distant empire. They are much more intelligent and deadly than the other enemies.
   1. They have limited sight in the dark, but they can *always* hear the player's footsteps, and if they spot the player they will continue to pursue them even without light nearby.
   2. They have set patrol paths, but actively pursue the player in hiding places. They can also commandeer nearby sentries to do their bidding, augmenting their existing abilities.
   3. They are only blinded by max-level illumination when ambushed - they will shield their eyes if they can see the player charging it.
5. Frost Legate: The only other magic wielders in the game.
   1. They possess all the properties of the Commandant, but can issue commands to them as well.
   2. Instead of the Commandant's melee attack, they possess a ranged ice blast.
   3. They have the same super jump the player has, allowing them to pursue them up cliffs and over gaps.

### Environment
(TODO: Flesh out environmental descriptions, and add more interactions)
1. Grass: Grass can be lit on fire to damage enemies or illuminate an area.
2. Torches: Torches can be lit to solve puzzles or illuminate an area.
3. Cesspools: Bubbling pools of flammable liquid. They augment any fire that passes over them, and can also fill the player's pouch for use as an incendiary or puzzle item.

### Structure
The islands are designed essentially like Zelda dungeons, where each one centers around a single ability or theme required for progression. Upon lighting the lighthouse of each island, an allied ferryman will take the player to the next with a brief cutscene interlude.

## Story
(TODO: I have some ideas, but nothing solid. Saving for later. -D)

## Visuals

### Perspective
While the game will be rendered in 3D, the player will play the game through a top-down ([axonometric](https://www.compuphase.com/axometr.htm)) perspective (see: [Hyper Light Drifter](https://www.youtube.com/watch?v=PLPSRUb2ALs)). Additionally, because the models are seen from afar (and mostly in some level of darkness), they can be very low poly.

### Fidelity
The game targets a [PS1-level of fidelity](https://www.patreon.com/posts/overview-of-49375996), with the sole exception of the lighting engine.

### Aesthetic
The islands have the visual character of Great Britain, particularly the [Scottish Highlands](https://en.wikipedia.org/wiki/Scottish_Highlands) and the [Cliffs of Dover](https://en.wikipedia.org/wiki/White_Cliffs_of_Dover). The design of the lighthouses, human enemies, and ships all broadly resemble their early modern (1600-1800) European equivalents. The pyromancer themselves resembles an earlier, stereotypically medieval idea of a sorcerer.

## Further Reading / Reference Games

### Light and Shadow Mechanics
- Thief: The Dark Project / Thief II
- Splinter Cell: Chaos Theory

### Reactive Environments / Naturalistic Stealth
- Metal Gear Solid 3

### Level / Puzzle Design
- A Link to the Past
- Oracle of Seasons

### Perspective / Aesthetic
- Hyper Light Drifter
