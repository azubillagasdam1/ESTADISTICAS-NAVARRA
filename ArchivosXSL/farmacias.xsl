<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">

        <svg xmlns="http://www.w3.org/2000/svg" width="1600" height="900">
            <image href="mapaNavarra2.jpg" x="0" y="0"
                   width="1180" height="858"/>

            <xsl:for-each select="data/row">
            <xsl:variable name="GEORR_X" select="GEORR_X"/>
            <xsl:variable name="GEORR_Y" select="GEORR_Y"/>

            <circle r="10" cx="{$GEORR_X * 48760.30169 - 2086758.018}" cy="{ -2590.352 - $GEORR_Y * 1789.023502}" fill="red"/>

            </xsl:for-each>
            <circle r="10" cx="480" cy="415" fill="red"/>
            <circle r="10" cx="795" cy="350" fill="red"/>
        </svg>

    </xsl:template>
</xsl:stylesheet>


        <!-- CordenadasMaps lugar1:(42.80609319719878, -1.679884302112502)
                Cordenadas pixeles lugar1: (480,415)
        -->
        <!-- CordenadasMaps lugar2:(42.81255337051798,-1.6435516323944408)
                        Cordenadas pixeles lugar2: (795,350)-->

<!-- relacion cordX1: 480 - 795 = -315
    relacion mapaX1: 42.80609319719878 - 42.81255337051798 = -0.0064601733192

    Calculo X : -315/-0.0064601733192 =  48760.3016878513472066

    relacion cordY1: 415 - 350 = 65
    relacion mapaY1: -1.679884302112502 - -1.6435516323944408 = -0.0363326697180612

    Calculo Y : 65/-0.0363326697180612 = -1789.0235015592066094069


    480 = 42.80609319719878 * ax -tx
    795 = 42.81255337051798 * ax -tx

    ax=48760.30169
    tx=2086758.018

    cx = gx * 48760.30169 - 2086758.018


    cy = vy - gy * ay

    415 = vy - -1.679884302112502 * ay
    350 = vy - -1.6435516323944408 * ay

    vy =  -2590.352  ay =  -1789.024

    cy = vy - gy * ay

    -->
