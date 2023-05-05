<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">


            <xsl:variable name="anchura" select="1"/>
            <xsl:variable name="numDatos" select="count(datos)" />
        <svg width="900000" height="900000" xmlns="http://www.w3.org/2000/svg">
            <xsl:for-each select="datos/dato">

                <xsl:variable name="Ano" select="Ano"/>
                <xsl:variable name="Mujeres" select="Mujeres"/>
                <xsl:variable name="Hombres" select="Hombres"/>
                <xsl:variable name="Densidad" select="Densidad"/>





                <rect x="{position()*50}" y="{0}"
                      width="20" height="{($Mujeres - 230000) div 20}"
                      fill="blue" stroke="black" stroke-width="1"/>

                <rect x="{position()*50+20}" y="{0}"
                      width="20" height="{($Hombres - 230000)div 20}"
                      fill="green" stroke="black" stroke-width="1"/>






            </xsl:for-each>
        </svg>
    </xsl:template>
</xsl:stylesheet>
