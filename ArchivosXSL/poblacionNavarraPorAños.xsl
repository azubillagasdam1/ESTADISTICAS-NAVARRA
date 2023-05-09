<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">



        <xsl:variable name="numDatos" select="count(datos)" />
        <svg width="1600" height="900" xmlns="http://www.w3.org/2000/svg" fill="black" stroke="black" stroke-width="1">

            <xsl:variable name="traslacion">70</xsl:variable>

            <!-- Añade un fondo -->
            <defs>
                <linearGradient id="grad" x1="0%" y1="0%" x2="100%" y2="0%">
                    <stop offset="0%" stop-color="#A9D1FF" />
                    <stop offset="50%" stop-color="#ffffff" />
                    <stop offset="100%" stop-color="#8CFFB3" />
                </linearGradient>
            </defs>
            <rect x="0" y="0" width="100%" height="100%" fill="url(#grad)" />






            <!-- Coloca la barra vertical -->
            <rect width="100%" height="100%" fill="url(#grid)"/>
            <line x1="80" y1="0" x2="80" y2="900" stroke="black" stroke-width="2"/>
            <!-- Coloca la barra inferior horizontal -->
            <rect width="100%" height="100%" fill="url(#grid)"/>
            <line x1="0" y1="900" x2="1600" y2="900" stroke="black" stroke-width="5"/>





            <!-- Crea las columnas -->

            <xsl:for-each select="datos/dato">
                <xsl:sort data-type="number" case-order="lower-first" select="Ano"/>

                <xsl:variable name="Ano" select="Ano"/>
                <xsl:variable name="Mujeres" select="Mujeres"/>
                <xsl:variable name="Hombres" select="Hombres"/>
                <xsl:variable name="Densidad" select="Densidad"/>
                <xsl:variable name="Media" select="($Mujeres + $Hombres) div 2" />

                <rect x="{position()*30+$traslacion}" y="{900 - (($Mujeres - 230000) div 120)}"
                      width="10" height="{($Mujeres - 230000) div 120}"
                      fill="blue" stroke="black" stroke-width="2" opacity="1"
                      rx="5" ry="5" />

                <rect x="{position()*30+10+$traslacion}" y="{900 - (($Hombres - 230000) div 120)}"
                      width="10" height="{($Hombres - 230000)div 120}"
                      fill="green" stroke="black" stroke-width="2" opacity="1"
                      rx="5" ry="5" />


                <rect x="{position()*30+$traslacion}" y="{900 - (($Media - 230000) div 120)}"
                      width="20" height="{($Media - 230000)div 120}"
                      stroke="black" stroke-width="2"  opacity="1" fill-opacity="0"
                      rx="5" ry="5" />

                <!-- Crea las lineas separadoras -->
                <line x1="70" y1="{900 - position()*30}" x2="90" y2="{900 - position()*30}" stroke="black" stroke-width="2"/>

                <!-- Crea las lineas horizontales -->
                <line x1="70" y1="{900 - position()*30}" x2="1600" y2="{900 - position()*30}" stroke="black" stroke-dasharray="5, 10" opacity="0.3"/>

                <!-- Añade los numeros de población -->
                <text x="{10}" y="{900-position()*30}" font-size="20" font-weight="bold">
                    <xsl:variable name="Numeros"> <xsl:value-of select="230000+ 3600*position()"/></xsl:variable>
                   <xsl:value-of select="concat(substring($Numeros,1,3), 'M')"/>

                </text>


            </xsl:for-each>

            <!-- Crea los degradados -->
            <defs>
                <linearGradient id="green">
                    <stop offset="0%" stop-color="#5eba5e"/>
                    <stop offset="100%" stop-color="#3c763d"/>
                </linearGradient>
                <linearGradient id="blue">
                    <stop offset="0%" stop-color="#0088ff"/>
                    <stop offset="100%" stop-color="#0055aa"/>
                </linearGradient>
            </defs>

            <!-- Leyenda -->
            <rect x="150" y="20" width="40" height="40" fill="url(#green)" rx="5" ry="5"/>
            <text x="200" y="45" font-size="18">Hombres</text>

            <rect x="150" y="80" width="40" height="40" fill="url(#blue)" rx="5" ry="5"/>
            <text x="200" y="105" font-size="18">Mujeres</text>

            <rect x="150" y="140" width="40" height="40" fill="url(#grey)" stroke-width="2" rx="5" ry="5"/>
            <text x="200" y="165" font-size="18">Media</text>




        </svg>

        <!-- Coloca los numeros abajo -->
        <svg width="1600" height="100">
            <xsl:variable name="traslacion">70</xsl:variable>
            <text x="{10}" y="{20}" font-size="20" font-weight="bold">
               AÑOS 🠮
            </text>
            <xsl:for-each select="datos/dato">
                <xsl:sort select="Ano" case-order="lower-first"/>
                <xsl:variable name="Ano" select="Ano"/>
                <text x="{position()*30+$traslacion}" y="{20}" font-size="20" font-weight="bold">
                    <xsl:value-of select="substring($Ano,3)"/>
                </text>


            </xsl:for-each>


        </svg>

    </xsl:template>
</xsl:stylesheet>