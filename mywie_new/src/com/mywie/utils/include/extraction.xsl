<?xml version="1.0" encoding="gbk"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<body>
				<h2>抽取的数据</h2>
				<table border="1">
					<tr bgcolor="#9acd32">
						<xsl:for-each
							select="extractions/titles/title">

							<th>
								<xsl:value-of select="." />
							</th>
						</xsl:for-each>
					</tr>
					<xsl:for-each select="extractions/datas/data">
						<tr>
							<xsl:if test="position()   mod   2=0">
								<xsl:attribute name="style">background:#3366CC</xsl:attribute>
							</xsl:if>

							<xsl:for-each select="value">
								<td>
									<xsl:value-of select="." />
								</td>
							</xsl:for-each>
						</tr>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>