<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="yes" omit-xml-declaration="no" />
	<xsl:template match="/">
		<dc:record xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<xsl:if test="//oai_dc:dc">
				<xsl:variable name="id1">
					<xsl:for-each select="//dc:identifier[contains(text(),'collection')]">
						<xsl:value-of select="substring-after(.,'id/')" />
					</xsl:for-each>	
				</xsl:variable>
				<xsl:variable name="id2">
					<xsl:value-of select="normalize-space($id1)"/>
				</xsl:variable>
				<xsl:variable name="file">
					<!-- some records had a filename with no extension which did not work -->
					<xsl:if test="//dc:identifier[contains(text(),'jpg')]"> 
						<xsl:value-of select="//dc:identifier[contains(text(),'jpg')]"/>
					</xsl:if>
				</xsl:variable>
				<xsl:for-each select="//oai_dc:dc/*">
					<xsl:copy-of select="."/>
				</xsl:for-each>
				<dc:identifier xsi:type="dcterms:URI">
					<xsl:choose>
						<xsl:when test="$file=''">  <!-- use a dummy file if the filename is not provided -->
							<xsl:text>http://www.51allout.co.uk/wp-content/uploads/2012/02/Image-not-found.gif</xsl:text>
						</xsl:when>
						<xsl:otherwise> 
							<!-- call CDM's getfile api - see http://www.contentdm.org/help6/custom/customize2ai.asp -->
							<xsl:value-of select="concat('http://contentdm.lib.byu.edu/utils/getfile/collection/Savage2/id/',$id2,'/filename/',$file)"/>
						</xsl:otherwise>
					</xsl:choose>
				</dc:identifier>
			</xsl:if>
		</dc:record>
	</xsl:template>
</xsl:stylesheet>