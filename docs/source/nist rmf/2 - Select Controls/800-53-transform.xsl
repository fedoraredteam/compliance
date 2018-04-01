<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:c="http://scap.nist.gov/schema/sp800-53/2.0"
    xmlns:controls="http://scap.nist.gov/schema/sp800-53/feed/2.0"
    xmlns:xhtml="http://www.w3.org/1999/xhtml"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://scap.nist.gov/schema/sp800-53/feed/2.0 http://scap.nist.gov/schema/sp800-53/feed/2.0/sp800-53-feed_2.0.xsd"
    version="2.0">
    <xsl:output method="text" omit-xml-declaration="yes" />
    
    <xsl:template match="c:statement">
        <xsl:text>&#x9;</xsl:text>
        <xsl:value-of select="c:number"/>
        <xsl:text>&#x9;&#x9;&#x9;&#x9;</xsl:text>
        <xsl:text>"</xsl:text><xsl:value-of select="c:description"/><xsl:text>"</xsl:text>
        <xsl:text>&#xa;</xsl:text>
        <xsl:apply-templates select="c:statement"/>
    </xsl:template>
    
    <xsl:template name="control-info">
        <xsl:text>&#x9;</xsl:text>
        <xsl:value-of select="c:number"/>
        <xsl:text>&#x9;</xsl:text>
        <xsl:value-of select="c:title"/>
        <xsl:text>&#x9;</xsl:text>
        <xsl:value-of select="c:priority"/>
        <xsl:text>&#x9;</xsl:text>
        <xsl:value-of select="string-join(c:baseline-impact,',')"/>
        <xsl:text>&#x9;</xsl:text>
        <xsl:text>"</xsl:text><xsl:value-of select="c:statement/c:description"/><xsl:text>"</xsl:text>
        <xsl:text>&#x9;</xsl:text>
        <xsl:if test="c:supplemental-guidance/c:description">
            <xsl:text>"</xsl:text><xsl:value-of select="replace(c:supplemental-guidance/c:description, '&#xa;', ' ')"/><xsl:text>"</xsl:text>
        </xsl:if>
        <xsl:text>&#x9;</xsl:text>
        <xsl:value-of select="string-join(c:supplemental-guidance/c:related,',')"/>
    </xsl:template>
    
    <xsl:template match="/controls:controls">
        <xsl:text>FAMILY&#x9;NAME&#x9;TITLE&#x9;PRIORITY&#x9;BASELINE-IMPACT&#x9;DESCRIPTION&#x9;SUPPLEMENTAL GUIDANCE&#x9;RELATED&#xa;</xsl:text>
        <xsl:for-each select="controls:control">
            <!-- Controls -->
            <xsl:variable name="family"><xsl:value-of select="c:family"/></xsl:variable>
            <xsl:value-of select="c:family"/>
            <xsl:call-template name="control-info"/>
            <xsl:text>&#xa;</xsl:text>
            <!-- Statements -->
            <xsl:apply-templates select="c:statement/c:statement"/>
            <!-- Control Enhancements -->
            <xsl:for-each select="c:control-enhancements/c:control-enhancement">
                <xsl:value-of select="$family"/>
                <xsl:call-template name="control-info"/>
                <xsl:text>&#xa;</xsl:text>
                <xsl:apply-templates select="c:statement/c:statement"/>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
