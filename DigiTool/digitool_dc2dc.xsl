<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:mets="http://www.loc.gov/METS/" xmlns:dnx="http://www.exlibrisgroup.com/dps/dnx" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:mods="http://www.loc.gov/mods/v3">
	<xsl:output method="xml" indent="yes" omit-xml-declaration="no" />
	<xsl:template match="/">
		<dc:record xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<xsl:if test="//oai_dc:dc">
				<xsl:for-each select="//dc:title">
					<dc:title>
						<xsl:value-of select="."/>
					</dc:title>
				</xsl:for-each>
				<xsl:for-each select="//dc:creator">
					<dc:creator>
						<xsl:value-of select="."/>
					</dc:creator>
				</xsl:for-each>
				<xsl:for-each select="//dc:subject">
					<dc:subject>
						<xsl:value-of select="."/>
					</dc:subject>
				</xsl:for-each>
				<xsl:for-each select="//dc:description">
					<dc:description>
						<xsl:value-of select="."/>
					</dc:description>
				</xsl:for-each>
				<xsl:for-each select="//dc:publisher">
					<dc:publisher>
						<xsl:value-of select="."/>
					</dc:publisher>
				</xsl:for-each>
				<xsl:for-each select="//dc:contributor">
					<dc:contributor>
						<xsl:value-of select="."/>
					</dc:contributor>
				</xsl:for-each>
				<xsl:for-each select="//dc:date">
					<dc:date>
						<xsl:value-of select="."/>
					</dc:date>
				</xsl:for-each>
				<xsl:for-each select="//dc:type">
					<dc:type>
						<xsl:value-of select="."/>
					</dc:type>
				</xsl:for-each>
				<xsl:for-each select="//dc:format">
					<dc:format>
						<xsl:value-of select="."/>
					</dc:format>
				</xsl:for-each>
				<xsl:for-each select="//dc:identifier">
					<dc:identifier>
						<xsl:value-of select="."/>
					</dc:identifier>
<!-- Create a dcterms:filename field with the expected filename	- use with Original File Name CS property. -->	
					<xsl:variable name="pid" select="substring-after(text(),'pid=')" />
					<xsl:variable name="ext" select="substring-after(//dc:format/text(),'/')" />
					<dcterms:filename>
						<xsl:value-of select="concat($pid, '.', $ext)" />
					</dcterms:filename>
				</xsl:for-each>
				<xsl:for-each select="//dc:source">
					<dc:source>
						<xsl:value-of select="."/>
					</dc:source>
				</xsl:for-each>
				<xsl:for-each select="//dc:language">
					<dc:language>
						<xsl:value-of select="."/>
					</dc:language>
				</xsl:for-each>
				<xsl:for-each select="//dc:relation">
					<dc:relation>
						<xsl:value-of select="."/>
					</dc:relation>
				</xsl:for-each>
				<xsl:for-each select="//dc:coverage">
					<dc:coverage>
						<xsl:value-of select="."/>
					</dc:coverage>
				</xsl:for-each>
				<xsl:for-each select="//dc:rights">
					<dc:rights>
						<xsl:value-of select="."/>
					</dc:rights>
				</xsl:for-each>
			</xsl:if>
		</dc:record>
	</xsl:template>
</xsl:stylesheet>
