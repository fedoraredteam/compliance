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

    <xsl:template match="c:objective">
        <xsl:text>&#x9;</xsl:text>
        <xsl:value-of select="c:number"/>
        <xsl:text>&#x9;&#x9;</xsl:text>
        <xsl:if test="c:decision">
            <xsl:text>"</xsl:text><xsl:value-of select="c:decision"/><xsl:text>"</xsl:text>
        </xsl:if>
        <xsl:text>&#xa;</xsl:text>
        <xsl:apply-templates select="c:objective"/>
    </xsl:template>
    
    <xsl:template name="objective-info">
        <xsl:text>&#x9;</xsl:text>
        <xsl:value-of select="c:number"/>
        <xsl:text>&#x9;</xsl:text>
        <xsl:value-of select="c:title"/>
        <xsl:text>&#x9;</xsl:text>
        <xsl:text>"</xsl:text><xsl:value-of select="c:objective/c:decision"/><xsl:text>"</xsl:text>
        <xsl:text>&#x9;</xsl:text>
        <xsl:if test="c:potential-assessments/c:potential-assessment[@method = 'EXAMINE']">
            <xsl:value-of select="string-join(c:potential-assessments/c:potential-assessment[@method = 'EXAMINE']/c:object,';')"/>
        </xsl:if>
        <xsl:text>&#x9;</xsl:text>
        <xsl:if test="c:potential-assessments/c:potential-assessment[@method = 'TEST']">
            <xsl:value-of select="string-join(c:potential-assessments/c:potential-assessment[@method = 'TEST']/c:object,';')"/>
        </xsl:if>
        <xsl:text>&#x9;</xsl:text>
        <xsl:if test="c:potential-assessments/c:potential-assessment[@method = 'INTERVIEW']">
            <xsl:value-of select="string-join(c:potential-assessments/c:potential-assessment[@method = 'INTERVIEW']/c:object,';')"/>
        </xsl:if>
        <xsl:text>&#x9;</xsl:text>
    </xsl:template>
    
    <xsl:template match="/controls:controls">
        <xsl:text>FAMILY&#x9;NAME&#x9;TITLE&#x9;DECISION&#x9;EXAMINE&#x9;TEST&#x9;INTERVIEW&#xa;</xsl:text>
        <xsl:for-each select="controls:control">
            <!-- Controls -->
            <xsl:variable name="family"><xsl:value-of select="c:family"/></xsl:variable>
            <xsl:value-of select="c:family"/>
            <xsl:call-template name="objective-info"/>
            <xsl:text>&#xa;</xsl:text>
            <!-- Objectives -->
            <xsl:apply-templates select="c:objective/c:objective"/>
            <!-- Control Enhancements -->
            <xsl:for-each select="c:control-enhancements/c:control-enhancement">
                <xsl:value-of select="$family"/>
                <xsl:call-template name="objective-info"/>
                <xsl:text>&#xa;</xsl:text>
                <xsl:apply-templates select="c:objective/c:objective"/>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
