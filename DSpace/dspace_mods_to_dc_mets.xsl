<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:mets="http://www.loc.gov/METS/" xmlns:dnx="http://www.exlibrisgroup.com/dps/dnx" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:mods="http://www.loc.gov/mods/v3">
	<xsl:output method="xml" indent="yes" omit-xml-declaration="no" />
	<xsl:template match="/">
		<mets:mets xmlns:mets="http://www.loc.gov/METS/">
			<mets:dmdSec ID="ie-dmd">
				<mets:mdWrap MDTYPE="DC">
					<mets:xmlData>
						<dc:record>
							<xsl:for-each select="//mods:title">
								<dc:title>
									<xsl:value-of select="."/>
								</dc:title>
							</xsl:for-each>
							<xsl:for-each select="//mods:topic">
								<dc:subject>
									<xsl:value-of select="."/>
								</dc:subject>
							</xsl:for-each>
						</dc:record>
					</mets:xmlData>
				</mets:mdWrap>
			</mets:dmdSec>
			<mets:amdSec ID="rep1-amd">
				<mets:techMD ID="rep1-amd-tech">
					<mets:mdWrap MDTYPE="OTHER" OTHERMDTYPE="dnx">
						<mets:xmlData>
							<dnx>
								<section id="generalRepCharacteristics">
									<record>
										<key id="preservationType">PRESERVATION_MASTER</key>
										<key id="usageType">VIEW</key>
									</record>
								</section>
							</dnx>
						</mets:xmlData>
					</mets:mdWrap>
				</mets:techMD>
			</mets:amdSec>
			<xsl:if test="//mets:fileGrp[@USE='TEXT']">
				<mets:amdSec ID="rep2-amd">
					<mets:techMD ID="rep2-amd-tech">
						<mets:mdWrap MDTYPE="OTHER" OTHERMDTYPE="dnx">
							<mets:xmlData>
								<dnx>
									<section id="generalRepCharacteristics">
										<record>
											<key id="preservationType">MODIFIED_MASTER</key>
											<key id="usageType">VIEW</key>
										</record>
									</section>
								</dnx>
							</mets:xmlData>
						</mets:mdWrap>
					</mets:techMD>
				</mets:amdSec>
			</xsl:if>
			<xsl:for-each select="//mets:fileGrp[@USE='ORIGINAL']/mets:file">
				<mets:amdSec>
					<xsl:attribute name="ID">fid1-<xsl:value-of select="position()"/>-amd</xsl:attribute>
					<mets:techMD>
						<xsl:attribute name="ID">fid1-<xsl:value-of select="position()"/>-amd-tech</xsl:attribute>
						<mets:mdWrap MDTYPE="OTHER" OTHERMDTYPE="dnx">
							<mets:xmlData>
								<dnx>
									<section id="fileFixity">
										<record>
											<key id="fixityType">
												<xsl:value-of select="@CHECKSUMTYPE"/>
											</key>
											<key id="fixityValue">
												<xsl:value-of select="@CHECKSUM"/>
											</key>
										</record>
									</section>
								</dnx>
							</mets:xmlData>
						</mets:mdWrap>
					</mets:techMD>
				</mets:amdSec>
			</xsl:for-each>
			<xsl:for-each select="//mets:fileGrp[@USE='TEXT']/mets:file">
				<mets:amdSec>
					<xsl:attribute name="ID">fid2-<xsl:value-of select="position()"/>-amd</xsl:attribute>
					<mets:techMD>
						<xsl:attribute name="ID">fid2-<xsl:value-of select="position()"/>-amd-tech</xsl:attribute>
						<mets:mdWrap MDTYPE="OTHER" OTHERMDTYPE="dnx">
							<mets:xmlData>
								<dnx>
									<section id="fileFixity">
										<record>
											<key id="fixityType">
												<xsl:value-of select="@CHECKSUMTYPE"/>
											</key>
											<key id="fixityValue">
												<xsl:value-of select="@CHECKSUM"/>
											</key>
										</record>
									</section>
								</dnx>
							</mets:xmlData>
						</mets:mdWrap>
					</mets:techMD>
				</mets:amdSec>
			</xsl:for-each>
			<mets:amdSec ID="ie-amd">
				<mets:techMD ID="ie-amd-tech">
					<mets:mdWrap MDTYPE="OTHER" OTHERMDTYPE="dnx">
						<mets:xmlData>
							<dnx>
								<section id="objectIdentifier">
								</section>
							</dnx>
						</mets:xmlData>
					</mets:mdWrap>
				</mets:techMD>
				<mets:rightsMD  ID="ie-amd-rights">
					<mets:mdWrap MDTYPE="OTHER" OTHERMDTYPE="dnx">
						<mets:xmlData>
							<dnx/>
						</mets:xmlData>
					</mets:mdWrap>
				</mets:rightsMD>
				<mets:sourceMD ID="ie-amd-source"/>
				<mets:sourceMD ID="ie-amd-source-MODS-1">
					<mets:mdWrap MDTYPE="MODS">
						<mets:xmlData>
							<mods:mods>
								<xsl:copy-of select="//mods:mods/*" />		
							</mods:mods>
						</mets:xmlData>
					</mets:mdWrap>
				</mets:sourceMD>
				<mets:digiprovMD  ID="ie-amd-digiprov">
					<mets:mdWrap MDTYPE="OTHER" OTHERMDTYPE="dnx">
						<mets:xmlData>
							<dnx/>
						</mets:xmlData>
					</mets:mdWrap>
				</mets:digiprovMD>
			</mets:amdSec>
			<mets:fileSec>
				<mets:fileGrp ID="rep1" ADMID="rep1-amd">
					<xsl:choose>
						<xsl:when test="//mets:fileGrp[@USE='ORIGINAL']">
							<xsl:for-each select="//mets:fileGrp[@USE='ORIGINAL']/mets:file/*">
								<mets:file>
									<xsl:attribute name="ID">fid1-<xsl:value-of select="position()"/>
									</xsl:attribute>
									<xsl:if test=".[@CHECKSUMTYPE]">
										<xsl:attribute name="ADMID">fid1-<xsl:value-of select="position()"/>-amd</xsl:attribute>
									</xsl:if>
									<xsl:copy-of select="."/>
								</mets:file>
							</xsl:for-each>
						</xsl:when>
						<!--  this catches records with no files  -->
						<xsl:otherwise>
							<mets:file ID="fid1-1">
								<mets:FLocat xmlns:xlink="http://www.w3.org/1999/xlink" LOCTYPE="URL" xlink:href="http://www.dspace.org/sites/dspace.org/files/dspace_logo.png"/>
							</mets:file>
						</xsl:otherwise>
					</xsl:choose>
				</mets:fileGrp>
				<xsl:if test="//mets:fileGrp[@USE='TEXT']">
					<mets:fileGrp ID="rep2" ADMID="rep2-amd">
						<xsl:for-each select="//mets:fileGrp[@USE='TEXT']/mets:file/">
							<mets:file>
								<xsl:attribute name="ID">fid2-<xsl:value-of select="position()"/>
								</xsl:attribute>
								<xsl:if test=".[@CHECKSUMTYPE]">
									<xsl:attribute name="ADMID">fid2-<xsl:value-of select="position()"/>-amd</xsl:attribute>
								</xsl:if>
								<xsl:copy-of select="mets:FLocat" />		
							</mets:file>
						</xsl:for-each>
					</mets:fileGrp>
				</xsl:if>
			</mets:fileSec>
		</mets:mets>
	</xsl:template>
</xsl:stylesheet>