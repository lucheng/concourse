<?xml version="1.0" encoding="gbk"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<body>
				<table border="1">
					<tr bgcolor="#9acd32">
						<xsl:for-each
							select="extractions/titles/title">

							<th>
								<xsl:value-of select="." />
							</th>
						</xsl:for-each>
					</tr>
					<xsl:for-each select="extractions/data">
						<tr>
							<xsl:if test="position() mod 2=0">
								<xsl:attribute name="style">background:#3366CC</xsl:attribute>
							</xsl:if>
							<td>
								<xsl:value-of select="fileName" />
							</td>
							<xsl:for-each select="value">
								<td>
									<xsl:value-of select="." />
								</td>
							</xsl:for-each>
							<xsl:for-each select="block">
								<td>
									<xsl:for-each select="value">
										<li><xsl:value-of select="." /></li>
									</xsl:for-each>
								</td>
							</xsl:for-each>
						</tr>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>