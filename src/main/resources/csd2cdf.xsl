<?xml version="1.0" encoding="UTF-8"?>
<xs:stylesheet version="1.0"
	xmlns:xs="http://www.w3.org/1999/XSL/Transform" xmlns="http://schemas.emsa.europa.eu/cdf/shipParticulars"
	xmlns:cdf="http://schemas.emsa.europa.eu/cdf" xmlns:ssn="urn:eu.emsa.ssn.ship"
	exclude-result-prefixes="ssn">
	<xs:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />

	<xs:template match="/ssn:SSN2MS_ShipParticulars_Ann">
		<EMSA>
			<xs:attribute name="source">
				<xs:value-of select="ssn:Header/@From"/>
			</xs:attribute>
			<xs:attribute name="timestamp">
				<xs:value-of select="ssn:Header/@SentAt"/>
			</xs:attribute>
			<xs:attribute name="id">
				<xs:value-of select="ssn:Header/@SSNRefId"/>
			</xs:attribute>
			
			<ShipParticularsMessage>
				<xs:attribute name="timestamp">
					<xs:value-of select="ssn:Header/@SentAt"/>
				</xs:attribute>
				
				<xs:variable name="ids" select="ssn:Body/ssn:ShipParticularsAnnouncement/ssn:VesselIdentification"/>
				
				<xs:for-each select="$ids/ssn:IMONumber">
					<cdf:IMO><xs:value-of select="."/></cdf:IMO>
				</xs:for-each>
				<xs:for-each select="$ids/ssn:Current_MMSINumber">
					<cdf:MMSI><xs:value-of select="."/></cdf:MMSI>
				</xs:for-each>
				<xs:for-each select="$ids/ssn:IRNumber">
					<cdf:IR><xs:value-of select="."/></cdf:IR>
				</xs:for-each>
				<xs:for-each select="$ids/ssn:Current_ShipName">
					<cdf:Name><xs:value-of select="."/></cdf:Name>
				</xs:for-each>
				<xs:for-each select="$ids/ssn:Current_CallSign">
					<cdf:CallSign><xs:value-of select="."/></cdf:CallSign>
				</xs:for-each>
				<xs:for-each select="$ids/ssn:Current_FlagRegistry">
					<cdf:FlagState><xs:value-of select="."/></cdf:FlagState>
				</xs:for-each>
			</ShipParticularsMessage>
		</EMSA>
	</xs:template>

</xs:stylesheet>
