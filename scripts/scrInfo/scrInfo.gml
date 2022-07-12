enum e_gamelist {
	mg1,
	mg2ss,
	mgs1,
	mgs2,
	mgs3,
	mgs4,
	mgspw,
	mgsvgz,
	mgsvtpp,
	
	length
}

function scrInfo() {
	if cover=0 {
		currentsong=muMG
		sprite_index=coverMG1 
		title="METAL GEAR" 
		number="" 
		subtitle="M S X 2" 
		year=1995
		incident="Outer Heaven Uprising"
		ext=492
		centertext=86

		description=
@"Solid Snake, member of Special Forces Unit FOXHOUND, is commanded
by Big Boss to sneak into the heavily-armed military base ''Outer Heaven'',
located in the depths of South Africa,

His mission is to destroy the ultimate weapon: Metal Gear''."
	}

	if cover=1 {
		currentsong=muMG2SS
		sprite_index=coverMG2SS
		title="METAL GEAR"
		number=2
		subtitle="S O L I D  S N A K E"  
		numbercolor=c_lime 
		year=1999
		incident="Zanzibar Land Disturbance"
		ext=534
		centertext=49

		description=
@"Following the Outer Heaven uprising, Solid Snake is tasked with
infiltrating Zanzibar Land, a country located in Central Asia, where 
a kidnapped scientist is being forced to work on a new Metal Gear model"
	}

	if cover=2 {
		currentsong=muMGS1
		sprite_index=coverMGS1
		title="METAL GEAR SOLID"
		number=""
		subtitle="I N T E G R A L"
		year=2005
		incident="Shadow Moses Incident"
		ext=629
		centertext=116

		description=
@"Your mission is to rescue hostages from an Alaskan military
installation and prevent a terrorist group from launching a
nuclear strike.
		"
	}

	if cover=3 {
		currentsong=muMGS2
		sprite_index=coverMGS2 
		title="METAL GEAR SOLID"
		number=2
		subtitle="S O N S  O F  L I B E R T Y"
		numbercolor=c_mgs2
		year="2007-2009"
		incident="Tanker and Big Shell Incident"
		ext=673
		centertext=80

		description=
@"After the Shadow Moses incident, technological data on the nuclear-armed
walking tank ''Metal Gear'' leaks onto the black market. Solid Snake and
his allies from the anti-Metal Gear NGO ''Philanthropy'' set out in pursuit
of a tanker carrying a new Metal Gear prototype. But Snake falls into a
trap set by former FOXHOUND member Ocelot, and is believed lost along
with the tanker at the bottom of the Hudson River.

Two years later, the Big Shell, an oil spill cleanup facility constructed
on the bay, is taken over by terrorists led by a man claiming to be
the long-lost Solid Snake. The government sends Raiden, a new recruit
in the new FOXHOUND, to infiltrate the Big Shell and rescue the
US President, who is held hostage inside....
"
	}

	if cover=4 {
		currentsong=muMGS3
		sprite_index=coverMGS3 
		title="METAL GEAR SOLID"
		number=3
		subtitle="S N A K E  E A T E R"
		numbercolor=c_green
		year="1964"
		incident="Virtuos Mission and Operation Snake Eater"
		ext=673
		centertext=80

		description=
@"Snake heads into Soviet territory to help the scientist
Sokolov defect to the West. However, the mission ends in failure when
Snake's mentor unexpectedly defects to the Soviet Union.

The fate of the world hanging in the balance, Snake is forced to
question the true meaning of ''loyalty'', as he embarks on a lone
mission to kill his former mentor.
		"
	}

	if cover=5 {
		currentsong=muMGS4
		sprite_index=coverMGS4 
		title="METAL GEAR SOLID"
		number=4
		subtitle="G U N S  O F  T H E  P A T R I O T S"
		numbercolor=c_maroon
		year="2014"
		incident="Guns of the Patriots Incident"
		ext=673
		centertext=45

		description=
@"In his final battle, a hero must stand alone.
Lead legendary hero Solid Snake in the final chapter of the 
Metal Gear Solid saga.
		"
	}

	if cover=6 {
		currentsong=muMGSPW
		sprite_index=coverMGSPW 
		title="METAL GEAR SOLID"
		number=""
		subtitle="P E A C E  W A L K E R"
		numbercolor=c_maroon
		year="1974"
		ext=629
		centertext=80
		incident="Peace Walker Incident"

		description=
@"The era is the 1970s, Big Boss has stationed his ''Army without a Nation''
in Colombia, South America, where he is approached by visitors from
Costa Rica--''a Nation without a military''

In the wake of the Cuban Missile Crisis, Latin America became key to
mantaining the power balance between East and West, but now, a
mysterious armed force threatens to disrupt the balance. To preserve
peace and neutrality in Costa Rica, the ''Soldiers without Borders'' move
into action. In time, they would come to be known as the founders of
''Outer Heaven''.
"
	}

	if cover=7 {
		currentsong=muMGSVGZ
		sprite_index=coverMGSVGZ 
		title="METAL GEAR SOLID"
		number="V"
		subtitle="G R O U N D  Z E R O E S"
		numbercolor=c_red
		year="1975"
		incident="Ground Zeroes Incident"
		ext=673
		centertext=80

		description=
@"MSF received a report indicating that Paz and Chico were being held
prisoners in a Cuban military base operated by the United States.
It is the job of the legendary mercenary Snake to go into Camp Omega 
and bring them back alive.

While Snake is busy, the UN will be visiting Mother Base to perform 
a nuclear inspection.
		"
	}

	if cover=8 {
		currentsong=muMGSVTPP
		sprite_index=coverMGSVTPP 
		title="METAL GEAR SOLID"
		number="V"
		subtitle="T H E  P H A N T O M  P A I N"
		numbercolor=c_red
		year="1984"
		incident="Phantom Pain Incident"
		ext=673
		centertext=80

		/*description=
		"All for revenge.

		After waking up from a coma, Big Boss (Punished ''Venom'' Snake)
		must build his new private army ''Diamond Dogs'' to prove to the whole world
		that the legend of Big Boss is still alive and achieve vengeance on Cipher.

		Trapped in a war without an end, Big Boss will be forced to face the phantoms
		of his past and discover the truth about the man who sold the world.
		"*/

		description=
@"Not for any nation. Not for any ideology. Only for revenge.

The soviet invasion of Afghanistan has brought a new edge to the Cold War, and in
1984, a one eyed phantom with a prosthetic arm appears in the country. Those who
know him call him Big Boss; the legendary mercenary who was once swept from the
stage of history and left in a coma by American private intelligene network Cipher.

Now, Snake's former partner Kazuhira Miller is being held by the Soviet forces in
Afghanistan. Snake must undertake a solo mission to rescue Miller and prove to the
world that the legendary mercenary is not dead and gone.

That first step will lead to a path of vengeance against the very Cipher that
slaughtered so many of Snake's men, and to a battle that will embroil the whole world...

"
	}



}
