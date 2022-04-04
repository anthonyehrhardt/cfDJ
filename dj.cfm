<!--- Get full path to mp3s. ---> <cfset mp3Directory = expandPath(".")>
<!--- Get directory ---> <cfdirectory action="list" directory="#mp3Directory#" name="mp3s" filter="*.mp3">

<!--- Do we have any images? ---> <cfif mp3s.recordCount gt 0>
<!--- How many images? --->
<cfset totalMp3s = mp3s.recordCount>

<!--- Pick one --->
<cfset pickedIndex = randRange(1, totalMP3s)>

<!--- get the file --->
<cfset image = mp3s.name[pickedIndex]>

<!--- play it --->
<!---<cfoutput><img src="#image#"></cfoutput>--->
<cfoutput><cfmediaplayer autoplay="true" src="mp3s" ></cfoutput>
</cfif>
<cfapplication name="mp3" sessionManagement="true">
<!--- Get full path to mp3s. ---> <cfset mp3Directory = expandPath(".")>

<!--- Get directory ---> <cfdirectory action="list" directory="#mp3Directory#" name="mp3s" filter="*.mp3">

<!--- Do we have any mp3s? ---> <cfif mp3s.recordCount gt 0>

<!--- How many mp3s? --->
<cfset totalMP3s = mp3s.recordCount>

<!--- param a session var --->
<cfparam name="session.pickedIndex" default="0">

<!--- Add one to the index --->
<cfset session.pickedIndex = session.pickedIndex + 1>

<!--- if past end, restart --->
<cfif session.pickedIndex gt mp3s.recordCount>
	<cfset session.pickedIndex = 1>
</cfif>

<!--- get the file --->
<cfset mp3 = mp3s.name[session.pickedIndex]>

<!--- play it --->
<cfoutput><cfmediaplayer autoplay="true" src="mp3s"></cfoutput>
</cfif>
